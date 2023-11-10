
import 'package:flutter/services.dart';

class Finger{
  String fullname;
  String gender;
  Uint8List bio;

  Finger({
    required this.fullname,
    required this.gender,
    required this.bio
  });

  Map<String, dynamic> toJson(){
    return {
      "fullname": fullname,
      "gender": gender,
      "bio": bio
    };
  }

  factory Finger.fromJson(Map<String, dynamic> json){
    return Finger(
      fullname: json["fullname"] as String,
      gender: json["gender"],
      bio: json["bio"]
    );
  }

  Future<dynamic> match() async {

  }

  Future<void> addToStore(){

  }

}
