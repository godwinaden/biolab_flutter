
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart' as en;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jose/jose.dart';

class TabData extends ChangeNotifier {
  static final TabData _tabData = TabData._internal();
  static get tabData => _tabData;

  int totalItemInCart = 0;
  double newVote = 0.0;
  dynamic selectedUser;
  List<String> votedFeatures = [];
  final TextStyle titleStyle = TextStyle(
    fontFamily: "Qhinanttika",
    fontWeight: FontWeight.w500,
    fontSize: 26,
    color: Colors.white,
    decoration: TextDecoration.none,
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.2),
        offset: const Offset(0.5, 0.5),
        blurRadius: 0.3,
      ),
    ],
  ), tabStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: "Lato-Italic",
    decoration: TextDecoration.none,
  ), nStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.black
  ), pStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.black87,
      fontFamily: "Lato-Italic"
  ),bStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontFamily: "Lato-Italic",
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  ), npStyle = const TextStyle(
    color: Colors.black87,
    fontSize: 16.0,
    decoration: TextDecoration.none,
  ), eStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    decoration: TextDecoration.none,
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.2),
        offset: const Offset(0.5, 0.5),
        blurRadius: 0.5,
      ),
    ],
  ), cStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontSize: 20.0,
      decoration: TextDecoration.none,
      fontFamily: "OpenSans-SemiBold"
  ), nRStyle = const TextStyle(
    color: Colors.black,
    fontSize: 16.0,
    fontFamily: "Lato-Italic",
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
  ), errStyle = const TextStyle(
    color: Colors.red,
    fontSize: 16.0,
    fontFamily: "Lato-Italic",
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  ), tNStyle = const TextStyle(
    color: Colors.black,
    overflow: TextOverflow.clip,
    fontSize: 15.0,
    fontFamily: "Oswald-Regular",
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  ), tTStyle = const TextStyle(
    color: Colors.black,
    fontSize: 10.0,
    fontFamily: "OpenSans-SemiBold",
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    overflow: TextOverflow.clip
  ), tBStyle = const TextStyle(
    color: Colors.black87,
    fontSize: 14.0,
    fontFamily: "Tamil Sangam MN",
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  ), tDStyle = const TextStyle(
    color: Colors.pink,
    fontSize: 11.0,
    overflow: TextOverflow.clip,
    fontFamily: "Damascus",
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  ), tEStyle = const TextStyle(
    color: Color(0xff000000),
    fontSize: 11.0,
    overflow: TextOverflow.clip,
    fontFamily: "OpenSans-Regular",
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  ), sanBoldStyle = const TextStyle(
    color: Color(0xff474747),
    fontSize: 14.0,
    overflow: TextOverflow.clip,
    fontFamily: "OpenSans-SemiBold",
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );
  final String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  bool timerEnded = false;


  factory TabData() {
    return _tabData;
  }

  void updateTimerEnded(bool status){
    timerEnded = status;
    notifyListeners();
  }

  InputDecoration getDecor(String label){
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black12),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black12),
      ),
      labelText: label,
      labelStyle: nRStyle,
    );
  }

  String getRandomString({int limit = 30}) {
    int randomNumber = _rnd.nextInt(limit) + 10;
    return String.fromCharCodes(
      Iterable.generate(
        randomNumber, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))
      )
    );
  }

  String toTitleCase(String str) {
    return str
      .replaceAllMapped(
      RegExp(
          r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
          (Match m) =>
      "${m[0]?[0].toUpperCase()}${m[0]?.substring(1).toLowerCase()}")
      .replaceAll(RegExp(r'(_|-)+'), ' ');
  }

  getFormattedNumber(int nu){
    return NumberFormat.compactCurrency(decimalDigits: 0, symbol: '').format(nu);
  }

  Widget getNotFoundWidget({required String title, required String desc}){
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_logo.png",
              width: 180,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20,),
            Text(
              title,
              style: tabData.cStyle.copyWith(color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2,),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                desc,
                style: tabData.nRStyle.copyWith(color: Colors.black45),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  String toTitleCaseWithoutSpace(String str) {
    return str
        .replaceAllMapped(
        RegExp(
            r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
            (Match m) =>
        "${m[0]?[0].toUpperCase()}${m[0]?.substring(1).toLowerCase()}")
        .replaceAll(RegExp(r'(_|-|" ")+'), '');
  }

  String shortenStringWithPeriod(String str, {int length = 30, bool makeTitleCased = true}){
    String newStr = makeTitleCased? toTitleCase(str) : str;
    return newStr.length > length? '${newStr.substring(0,length)}...': newStr;
  }

  String encryptPayload(Map<String, dynamic> payload) {
    var builder = JsonWebEncryptionBuilder();
    builder.jsonContent = json.encode(payload);
    var jwk = JsonWebKey.fromPem('00f239c3c78ce58adce0e91123637355db7c317b16ae7957e8e86e5ce498b294');
    builder.addRecipient(jwk, algorithm: "RSA-OAEP-256");
    builder.encryptionAlgorithm = "A256GCM";
    builder.setProtectedHeader("kid", "00f239c3c78ce58adce0e91123637355db7c317b16ae7957e8e86e5ce498b294");
    builder.mediaType = 'Application/JSON';
    var jwe = builder.build();

    // output the compact serialization
    return jwe.toCompactSerialization();
  }

  Future<dynamic> decryptPayload(String encodedPayload) async {
    var jwe = JsonWebEncryption.fromCompactSerialization(encodedPayload);
    var jwk = JsonWebKey.fromPem('c97d83996923d9966854614de34b36682d59a3f6630712f50bc8b4b5a4d82131');
    var keyStore = JsonWebKeyStore()..addKey(jwk);

    // decrypt the payload
    var payload = await jwe.getPayload(keyStore);
    return payload.jsonContent;
  }

  Headers getMasterHeaders(){
    Headers headers = Headers();
    headers.set("Authorization", 'Bearer ');
    headers.set("Content-Type", 'application/json');
    headers.set("Content-Length", 380);
    headers.set("Accept", 'application/ JSON');
    headers.set("x-encrypted", true);
    return headers;
  }

  Map<String, dynamic> encodePayload(dynamic data){
    return {
      "encrypted_payload": {
        "data": encryptPayload(data)
      }
    };
  }

  Future<dynamic> decodedPayload(dynamic encodedPayload) async{
    return decryptPayload(encodedPayload["encrypted_payload"]["data"]);
  }

  String encryptString(String str) => encrypter.encrypt(str, iv: enIV).base64;

  String decryptString(String str) => encrypter.decrypt64(str, iv: enIV);

  bool isBase64(str) {
    RegExp regExp = RegExp(
      r"^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?$",
      caseSensitive: false,
      multiLine: false,
    );
    return regExp.hasMatch(str);
  }

  TabData._internal();
}

final enKey = en.Key.fromLength(32);
final enIV = en.IV.fromLength(8);
final encrypter = en.Encrypter(en.Salsa20(enKey));
final tabData = TabData();

void handler(String name, Function method,  {Function? onError}) async {
  try{
    if(method is Future Function()) {
      await method();
    }else {
      method();
    }
  }catch(ex){
    debugPrint("$name Error: $ex");
    if(onError != null) onError();
  }
}
