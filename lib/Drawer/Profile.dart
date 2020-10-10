import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojectapp/Services/AuthService.dart';

class Profile extends StatefulWidget {
  final User finaluser;
  Profile(this.finaluser);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
        appBar: AppBar(title:Text("Profile"),centerTitle: true,elevation: 0,),
          body: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child:  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/jhondoe.png"),
                    radius: 50,
                  ),),
                SizedBox(height: 5,),
                Divider(thickness: 5 ,),
                Container(
                  child: Text(widget.finaluser.phoneNumber,style: TextStyle(color: Colors.green),),
                ),
                Container(
                  child: RaisedButton(onPressed: (){
                    AuthService().signOut(this.context);},
                    child: Text("Sign Out",style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                )
                // Container(
                //   child:Text(widget.finaluser.displayName),
                // )
              ],
            ),
          ),
        ));
  }
}
