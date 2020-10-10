import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojectapp/Services/AuthService.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
  home: AuthService().handleAuth(),
    theme: ThemeData(
      primarySwatch:Colors.green,
      accentColor: Colors.white,
    )
  )
  );
}
