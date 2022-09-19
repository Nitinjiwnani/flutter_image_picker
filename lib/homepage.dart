import 'dart:io';
import 'package:camera_platform_interface/src/types/camera_description.dart';
import "package:flutter/material.dart";
import 'package:flutter_image_picker/camera_screen.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  late List<CameraDescription> cameras;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Upload"), actions: [
        IconButton(
            onPressed: () {
              CameraScreen(widget.cameras);
            },
            icon: const Icon(Icons.image))
      ]),
    );
  }
}
