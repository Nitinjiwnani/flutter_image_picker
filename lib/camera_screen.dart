import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_image_picker/main.dart';

class CameraScreen extends StatefulWidget {
  late List<CameraDescription> cameras;

  CameraScreen(this.cameras);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> cameraValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        new CameraController(widget.cameras[0], ResolutionPreset.medium);
    cameraValue = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.flash_off,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {},
                ),
                InkWell(
                  onTap: (() {}),
                  child: Icon(
                    Icons.panorama_fish_eye,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.flip_camera_ios,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Hold for video, tap for photo",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )
          ]),
        ),
      ]),
    );
  }
}
