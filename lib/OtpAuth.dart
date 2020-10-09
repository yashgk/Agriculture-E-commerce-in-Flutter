import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:miniprojectapp/Data.dart';

class OtpAuth extends StatefulWidget {
  OtpAuth(Data user);
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpAuth> {
TextEditingController _otpController=new TextEditingController();

  Widget _buildTitle(){
    return Container(
      child: Text("Verify",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
    );
  }
  Widget _buildOtpbox(){
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text("Please enter an OTP verification code which is sent to your mobile number +91 9033353762",
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold,),
          ),
          SizedBox(height: 40,),
          TextField(
            controller:_otpController ,
            textInputAction: TextInputAction.done,
            maxLength: 4,
            style: TextStyle(fontSize: 20,letterSpacing: 50,color: Colors.green,fontWeight: FontWeight.bold),
            maxLengthEnforced: true,
            showCursor: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              counterText: "",
              hintText: "----",
              hintStyle: TextStyle(fontSize: 20,letterSpacing: 50,color: Colors.green,fontWeight: FontWeight.bold),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
  Widget _buildVerify(){
    return Container(
      child: RaisedButton(
        onPressed: (){},
        color: Colors.white,
        splashColor: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 60,vertical: 15),
        child:Text("Submit",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          resizeToAvoidBottomInset: false,
          body:Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.green[300],
                      Colors.green[700]
                    ]
                  )
                ),
              ),
              Align(child: _buildTitle(),alignment: Alignment(0,-0.9),),
              Align(child: _buildOtpbox(),alignment: Alignment(0,-0.6),),
              Align(child: _buildVerify(),alignment: Alignment(0,0),)
            ],
          )
        ),
    );
  }
}
