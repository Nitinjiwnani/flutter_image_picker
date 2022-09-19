import 'dart:io';
import 'package:camera_platform_interface/src/types/camera_description.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  var cameras;
  HomePage(this.cameras);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final picker = ImagePicker();
  File? file;
  XFile? pickedImage;
  bool isLoading = false;
  List<File?> fileList = [];

  Future pickImageFromGallery(cameras) async {
    pickedImage = await picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    setState(() {
      file = File(pickedImage!.path);
      fileList.add(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Upload"), actions: [
        IconButton(
            onPressed: () {
              pickImageFromGallery(widget.cameras);
            },
            icon: const Icon(Icons.image))
      ]),
    );
  }
}
