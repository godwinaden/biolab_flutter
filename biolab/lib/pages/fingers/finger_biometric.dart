import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opencv_4/factory/pathfrom.dart';
import 'package:opencv_4/opencv_4.dart';

class FingerBiometric extends StatefulWidget {
  const FingerBiometric({Key? key}) : super(key: key);

  @override
  FingerBiometricState createState() => FingerBiometricState();
}

class FingerBiometricState extends State<FingerBiometric> {
  final GlobalKey<ScaffoldState> _scofKey = GlobalKey();

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
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scofKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text(
          'Fingerprint Biometrics',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16
          ),
          textAlign: TextAlign.center,
        ),
        foregroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Text(
              "What Finger Feature Do you want to perform?",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        onPressed: getCamera,
        tooltip: "Enrol FingerPrint",
        child: Icon(
          FontAwesomeIcons.fingerprint,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
