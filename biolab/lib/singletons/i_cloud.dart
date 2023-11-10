import 'dart:async';
import 'dart:convert';
import 'package:cryptography/cryptography.dart';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../components/page_transitions/scale.dart';

class ICloud extends ChangeNotifier{
  static final ICloud _iCloud = ICloud._internal();
  static get iCloud => _iCloud;


  factory ICloud() {
    return _iCloud;
  }

  Future<bool> checkNetwork() async{
    await ConnectionNotifierTools.initialize();
    if(ConnectionNotifierTools.isConnected) {
      return true;
    } else {
      return false;
    }
  }

  /*
  * type 0
  * * */
  void showSnackBar(String msg, BuildContext context, {String title = 'Oops!'
    , int type = 0} ){
    ContentType contentType = getType(type);
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: msg,
        messageFontSize: 16.0,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);

  }

  ContentType getType(int value){
    switch(value){
      case 0: return ContentType.help;
      case 1: return ContentType.warning;
      case 2: return ContentType.success;
      default: return ContentType.failure;
    }
  }

  Future<Mac> getSignature(String secret, dynamic payload) async {
    final hmac = Hmac.sha256();
    List<int> secretInBytes = utf8.encode(secret);
    List<int> payloadInBytes = utf8.encode(payload);
    final mac = await hmac.calculateMac(
      payloadInBytes,
      secretKey: SecretKey(secretInBytes),
    );
    return mac;
  }

  void goto( BuildContext context, Widget where) => Navigator.push(context, ScaleRoute(page: where));

  ICloud._internal();
}

const bool useTestEnvironment = true;
bool isLoggedIn = false;
final dio = Dio();
final iCloud = ICloud();
