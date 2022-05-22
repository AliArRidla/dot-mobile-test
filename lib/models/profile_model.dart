import 'package:flutter/material.dart';

class PlaceModel {
  // "id" : 1,
  //       "username" : "olivia",
  //       "fullname" : "Olivia Jensen",
  //       "email" : "olivia@gmail.com",
  //       "phone" : "+628130305872",
  //       "avatar" : "https://i.imgur.com/UBJuJHp.jpg"
  int id;
  String nama;
  String namaLengkap;
  String email;
  String phone;
  String avatar;

  PlaceModel({
    this.id,
    this.nama,
    this.namaLengkap,
    this.email,
    this.phone,
    this.avatar,
  });

  PlaceModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nama = json['username'];
    namaLengkap = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
  }

  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'username': nama,
      'fullname': namaLengkap,
      'email': email,
      'phone': phone,
      'avatar': avatar,
    };
  }
}
