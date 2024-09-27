import 'dart:isolate';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image/image.dart' as img;

class ImageProcessingInIsolation extends StatefulWidget {
  const ImageProcessingInIsolation({super.key});

  @override
  State<ImageProcessingInIsolation> createState() =>
      _ImageProcessingInIsolationState();
}

class _ImageProcessingInIsolationState
    extends State<ImageProcessingInIsolation> {
  Uint8List? _originalImage;
  Uint8List? _processedImage;

  @override
  void initState() {
    super.initState();
    _loadImage();
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
            onPressed: _imageProcessIsolation,
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

  Future<void> _imageProcessIsolation() async {
    if (_originalImage == null) return;

    ReceivePort receivePort = ReceivePort();

    await Isolate.spawn(
        _convertToGrayscale, [receivePort.sendPort, _originalImage]);

    receivePort.listen(
      (message) {
        setState(() {
          _processedImage = message;
        });
      },
    );
  }

  static void _convertToGrayscale(List<dynamic> args) {
    final SendPort sendPort = args[0];
    final Uint8List imageData = args[1];

    img.Image? image = img.decodeImage(imageData);
    var imageGrayScale = img.grayscale(image!);

    Uint8List grayScalebytesImage =
        Uint8List.fromList(img.encodeJpg(imageGrayScale));
    sendPort.send(grayScalebytesImage);
  }

  Future<void> _loadImage() async {
    final imageData =
        await rootBundle.load('assets/pharmacyImages/pampers.jpg');
    setState(() {
      _originalImage = imageData.buffer.asUint8List();
    });
  }
}

void main(List<String> args) {
  runApp(const MyImageApp());
}

class MyImageApp extends StatefulWidget {
  const MyImageApp({super.key});

  @override
  State<MyImageApp> createState() => _MyImageAppState();
}

class _MyImageAppState extends State<MyImageApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImageProcessingInIsolation(),
    );
  }
}
