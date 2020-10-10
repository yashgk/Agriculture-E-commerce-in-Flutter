import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojectapp/Screens/HomeScreen.dart';
import 'package:miniprojectapp/Screens/LoginScreen.dart';

class AuthService
{
  handleAuth()
  {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot){
        if(snapshot.hasData) {
          print("you already have user");
          return HomeScreen(FirebaseAuth.instance.currentUser);
        }
        else
          print("Uh oh you need to login");
          return LoginScreen();
        }
    );
  }
  signOut(context)
  {
    FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
    print("no user");
  }
}