import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File? prescribeImage;
ImagePicker picker = ImagePicker();

Future<void> getPrescribeImage() async {
  final pickedFile = await picker.pickImage(
    source: ImageSource.camera,
  );

  if (pickedFile != null) {
    prescribeImage = File(pickedFile.path);
    // setState(() {
    //   print('picked successfully');
    // });
  } else {
    if (kDebugMode) {
      print('No image selected.');
    }
    // setState(() {
    //   print('error');
    // });
  }
}

Widget showPrescriptionImage(){
  return Container();
}
