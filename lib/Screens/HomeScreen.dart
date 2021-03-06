import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miniprojectapp/Drawer/Profile.dart';
import 'package:miniprojectapp/Drawer/About.dart';
import 'package:miniprojectapp/Drawer/Wishlist.dart';
import 'package:miniprojectapp/Drawer/Settings.dart';
import 'package:miniprojectapp/Drawer/Order.dart';
import 'package:miniprojectapp/Services/AuthService.dart';
class HomeScreen extends StatefulWidget {
final User finaluser;
HomeScreen(this.finaluser);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle:true ,
          elevation: 0,
          title: Text("Agrozon"),

        ),
        drawer: Container(
          width: 250,
          child: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  color: Colors.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/jhondoe.png"),
                        radius: 50,
                      ),
                      SizedBox(height: 20,),
                      Text(widget.finaluser.phoneNumber,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  ),
                ),
                Divider(thickness: 3,height: 3,),
                ListTile(
                  title: Text("Profile"),
                  leading: Icon(Icons.person),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile(widget.finaluser)));},
                ),
                Divider(thickness: 1,height: 3,),
                ListTile(
                  title: Text("Orders"),
                  leading: Icon(Icons.shopping_bag),
                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Order()));},
                ),
                Divider(thickness: 1,height: 3,),
                ListTile(
                  title: Text("Wishlist"),
                  leading: Icon(Icons.favorite),
                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Wishlist()));},
                ),
                Divider(thickness: 1,height: 3,),
                ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));},
                ),
                Divider(thickness: 1,height: 3,),
                ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.info),
                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> About()));},
                ),
                Divider(thickness: 1,height: 3,),
                Spacer(),
                Text("App Version : 1.0.0", style: TextStyle(fontSize: 12),),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(),
            Text("Agrozon")
          ],
        ),
      ),
    );
  }
}
