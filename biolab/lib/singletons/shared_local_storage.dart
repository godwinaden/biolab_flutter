import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../models/FingerBio.dart';

class MyStorage extends ChangeNotifier {
  static final MyStorage _myStorage = MyStorage._internal();
  static get myStorage => _myStorage;

  GetStorage lStore = GetStorage();
  bool hasInitialized = false;
  List<Finger> fingers = [];

  factory MyStorage() {
    return _myStorage;
  }

  void addToFingerPrint(Finger finger){
    try {
      fingers.add(finger);
      addToStore(key: "fingers", value: convertFingersToJson())
          .then((_) => notifyListeners())
          .catchError((ex) {
        debugPrint("MyStorage addToFingerPrint Error: $ex");
      });
    }catch(ex){debugPrint("MyStorage addToFingerPrint Error: $ex");}
  }

  String convertFingersToJson(){
    List<String> dItems = [];
    try {
      if(fingers.isNotEmpty) {
        for (Finger fin in fingers) {
          dItems.add(jsonEncode(fin));
        }
      }
    }catch(ex){debugPrint("MyStorage convertFingersToJson Error: $ex");}
    return '''$dItems''';
  }

  List<Finger> setFingers(){
    List<Finger> mainFins = [];
    String? fins = getFromStore(key: "fingers");
    if(fins != null) {
      List? fromLocalStore = jsonDecode(fins);
      if (fromLocalStore != null && fromLocalStore.isNotEmpty) {
        for (var fin in fromLocalStore) {
          mainFins.add(Finger.fromJson(fin));
        }
      }
    }
    return mainFins;
  }

  Future<void> initializeValues() async {
    try{
      fingers = setFingers();
      hasInitialized = true;
      notifyListeners();
    }catch (ex) {
      debugPrint("SharedLocalStorage: initializeValues(): $ex");
    }
  }

  Future<void> addToStore({required String key, required dynamic value}) async {
    try{
      await lStore.write(key, value);
    }catch (ex) {
      debugPrint(ex.toString());
    }
  }

  dynamic getFromStore({required String key}) {
    dynamic result;
    try{
      result = lStore.read(key);
    }catch (ex) {
      debugPrint(ex.toString());
    }
    return result;
  }

  // inWhat: 0 -seconds, 1 -minutes, 2 -hour, 3 -days
  int dateDifference({required DateTime dDate, int inWhat = 3}){
    final today = DateTime.now();
    int diff = inWhat == 0? today.difference(dDate).inSeconds : (
      inWhat == 1? today.difference(dDate).inMinutes : (
        inWhat == 2?  today.difference(dDate).inHours : today.difference(dDate).inDays
      )
    );
    return diff;
  }

  MyStorage._internal();
}

final myStorage = MyStorage();
