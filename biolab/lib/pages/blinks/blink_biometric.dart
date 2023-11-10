import 'package:biolab/components/work_in_progress.dart';
import 'package:flutter/material.dart';

class BlinkBiometric extends StatefulWidget {
  const BlinkBiometric({Key? key}) : super(key: key);

  @override
  BlinkBiometricState createState() => BlinkBiometricState();
}

class BlinkBiometricState extends State<BlinkBiometric> {
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
