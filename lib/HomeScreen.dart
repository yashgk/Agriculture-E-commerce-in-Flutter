import 'package:flutter/material.dart';
import 'Data.dart';
Data user=new Data();
class HomeScreen extends StatefulWidget {
  HomeScreen(Data obj)
  {
    user=obj;
  }
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
                      Text("+91"+user.getPhone().toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  ),
                ),
                Divider(thickness: 3,height: 3,),
                ListTile(
                  title: Text("Profile"),
                  leading: Icon(Icons.person),
                  onTap: (){},
                ),
                Divider(thickness: 1,height: 3,),
                ListTile(
                  title: Text("Orders"),
                  leading: Icon(Icons.shopping_bag),
                  onTap: (){},
                ),
                Divider(thickness: 1,height: 3,),
                ListTile(
                  title: Text("Wishlist"),
                  leading: Icon(Icons.favorite),
                  onTap: (){},
                ),
                Divider(thickness: 1,height: 3,),
                ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                  onTap: (){},
                ),
                Divider(thickness: 1,height: 3,),
                ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.info),
                  onTap: (){},
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
