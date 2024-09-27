import 'dart:async';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImageProcessingScreen(),
    );
  }
}

class ImageProcessingScreen extends StatefulWidget {
  const ImageProcessingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageProcessingScreenState createState() => _ImageProcessingScreenState();
}

class _ImageProcessingScreenState extends State<ImageProcessingScreen> {
  Uint8List? _originalImage;
  Uint8List? _processedImage;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    // Load the image from assets
    final imageData =
        await rootBundle.load('assets/pharmacyImages/pampers.jpg');
    setState(() {
      _originalImage = imageData.buffer.asUint8List();
    });
  }

  Future<void> _processImageInIsolate() async {
    if (_originalImage == null) return;

    // Create a ReceivePort to get the result from the isolate
    final ReceivePort receivePort = ReceivePort();

    // Spawn an isolate and send the image data to the isolate
    await Isolate.spawn(
        _convertToGrayscale, [receivePort.sendPort, _originalImage]);

    // Listen for the processed image data from the isolate
    receivePort.listen((processedImage) {
      setState(() {
        _processedImage = processedImage;
      });
    });
  }

  // This function runs on the isolate to process the image
  static void _convertToGrayscale(List<dynamic> args) {
    SendPort sendPort = args[0];
    Uint8List imageData = args[1];

    // Decode the image
    img.Image? image = img.decodeImage(imageData);

    // Convert the image to grayscale
    img.Image grayscale = img.gamma(gamma: 100,image!);

    // Encode the image back to Uint8List
    Uint8List grayscaleBytes = Uint8List.fromList(img.encodeJpg(grayscale));

    // Send the processed image back to the main isolate
    sendPort.send(grayscaleBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Isolate Image Processing")),
      body: Column(
        children: [
          if (_originalImage != null) ...{
            Image.memory(_originalImage!,
                height: 200, width: 200, fit: BoxFit.cover),
          },
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _processImageInIsolate,
            child: const Text("Convert to Grayscale"),
          ),
          const SizedBox(height: 20),
          if (_processedImage != null)
            Image.memory(_processedImage!,
                height: 200, width: 200, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
