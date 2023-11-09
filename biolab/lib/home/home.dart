import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opencv_4/factory/pathfrom.dart';
import 'package:opencv_4/opencv_4.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  void getCamera() async {
    try{
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if(pickedFile != null){
        File photoFinger = File(pickedFile.path);
        Uint8List? byte = await Cv2.morphologyEx(
          pathFrom: CVPathFrom.GALLERY_CAMERA,
          pathString: photoFinger.path,
          operation: Cv2.COLOR_BayerGB2RGB,
          kernelSize:  [30, 30],
        );
        debugPrint("Finger: $byte");
      }
    }catch(ex){
      debugPrint("getCamera Error: $ex");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
