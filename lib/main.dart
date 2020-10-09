import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Nilesh/AndroidStudioProjects/miniprojectapp/lib/Screens/LoginScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
    theme: ThemeData(
      primarySwatch:Colors.green,
      accentColor: Colors.white,
    )
  )
  );
}
