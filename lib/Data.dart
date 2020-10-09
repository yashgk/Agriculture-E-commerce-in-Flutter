
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Data{
  String name;
  int phone;
  Image userphoto;
  int getPhone(){
    return  this.phone;
  }
  void setPhone(int val){
    this.phone=val;
  }
  String getName(){
    return this.name;
  }
  void setName(String val){
    this.name=val;
  }
  void setUserPhoto(Image val){
    this.userphoto=val;
  }
  Image getUserPhoto(){
    return this.userphoto;
  }
}