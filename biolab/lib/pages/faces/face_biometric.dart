import 'package:flutter/material.dart';

import '../../components/work_in_progress.dart';

class FaceBiometric extends StatefulWidget {
  const FaceBiometric({Key? key}) : super(key: key);

  @override
  FaceBiometricState createState() => FaceBiometricState();
}

class FaceBiometricState extends State<FaceBiometric> {
  final GlobalKey<ScaffoldState> _scofKey = GlobalKey();

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
          'Face Recognition',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16
          ),
          textAlign: TextAlign.center,
        ),
        foregroundColor: Colors.blue,
      ),
      body: WorkInProgress(),
    );
  }
}
