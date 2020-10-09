import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniprojectapp/OtpAuth.dart';
import 'Data.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Data user=new Data();
 final _inputController = TextEditingController();
var _formKey = GlobalKey<FormState>();

 Widget _buildHeading(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
      children :[
     Text("Welcome.", style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold)),
   ]
   );
 }
 Widget _buildLoginform(){
   return SingleChildScrollView(
     padding: EdgeInsets.all(15),
     child: Container(
       padding: EdgeInsets.all(15),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(15.0),
         color: Colors.white,
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("Verify your phone number", style: TextStyle(color:Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
           SizedBox(height: 40,),
           Text("Agrozon will send an SMS message to verify your phone number, Enter your 10 digit phone number",
             style: TextStyle(color:Colors.green,fontSize: 15,fontWeight: FontWeight.bold,),
             textAlign: TextAlign.center,
           ),
           SizedBox(height: 40,),
           Form(
             key: _formKey,
             child: TextFormField(
               controller:_inputController ,
               textInputAction: TextInputAction.done,
               maxLength: 10,
               maxLengthEnforced: true,
               validator: (String arg) {
                 if(arg.length <10)
                   return "Please Enter 10 digit number";
               },
               decoration: InputDecoration(
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                 prefixIcon: Icon(Icons.call),
                 prefixText: "+91 ",
                 labelText: "Mobile No.",
                 counterText: "",
                 labelStyle: TextStyle(fontSize: 18),
                 floatingLabelBehavior: FloatingLabelBehavior.auto,
               ),
               keyboardType: TextInputType.phone,
             ),
           ),
           SizedBox(height: 40),
           RaisedButton(onPressed:(){
             setState(() {
               user.setPhone(int.parse(_inputController.text));
               if(_formKey.currentState.validate())
               {
                 Navigator.push(context, MaterialPageRoute(
                     builder: (context) => OtpAuth(user)));
               }
             });
             },
             color: Colors.green,
             padding: EdgeInsets.symmetric(horizontal: 60),
             child: Text("Get Started", style: TextStyle(fontSize: 20,color: Colors.white),),
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

           ),
         ],
       ),
     ),
   );
 }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
                body: Stack(
                  children:[
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green[300],
                            Colors.green[700],
                          ],

                        )
                      ),
                    ),
                    Positioned(
                        top: 30,
                        width: MediaQuery.of(context).size.width,
                        child: _buildHeading()),
                    Align(
                      alignment: Alignment(0,0),
                        child:_buildLoginform()
                    ),
                  ]
                ),
        )
    );
  }
}