import 'package:flutter/material.dart';

import '../../components/work_in_progress.dart';

class HandBiometric extends StatefulWidget {
  const HandBiometric({Key? key}) : super(key: key);

  @override
  HandBiometricState createState() => HandBiometricState();
}

class HandBiometricState extends State<HandBiometric> {
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
          'Eye Blink Biometrics',
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
