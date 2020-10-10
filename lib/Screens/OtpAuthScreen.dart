import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:miniprojectapp/Screens/HomeScreen.dart';
import 'package:miniprojectapp/Screens/LoginScreen.dart';
class OtpAuthScreen extends StatefulWidget {
  final String _phone;
  OtpAuthScreen(this._phone,);
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpAuthScreen> {
  TextEditingController _otpController=new TextEditingController();

  void initState() {
    super.initState();
    print("ok1");
    _userAuth();
    print("ok2");
  }

void codeSENT(String id,int token){}
  Future<void> _userAuth() async{
    FirebaseAuth _auth=FirebaseAuth.instance; //Initiate Firebase instance

    _auth.verifyPhoneNumber(
        timeout: Duration(seconds: 60),
        phoneNumber: widget._phone,

        verificationCompleted: (AuthCredential credential) async {
          print("verification complete");
          UserCredential _userCredential= await _auth.signInWithCredential(credential);
          User _user=_userCredential.user;
          if(_user!=null)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(_user)));
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          print("verification failed");
          showDialog(context: context,child: Text(e.toString()));
          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
        },
      codeSent:
            (String verificationId, int resendToken) async {
          print("code sent");
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpAuthScreen(phone)));
          // final code=_otpController.text;
          // AuthCredential _credential= PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
          // UserCredential _userCredential=await _auth.signInWithCredential(_credential);
          // User _user=_userCredential.user;
          // if(_user!=null)
          // {
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(_user)));
          // }
          // else
          //   {
          //     showDialog(context: context,child: Text("Error"));
          //     Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
          //   }
        },
        codeAutoRetrievalTimeout: (String verificationId) async{
          print("code auto retrieval timeout");
          final code=_otpController.text;
          AuthCredential _credential= PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
          UserCredential _userCredential=await _auth.signInWithCredential(_credential);
          User _user=_userCredential.user;
          if(_user!=null)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(_user)));
          }
          else
          {
            showDialog(context: context,child: Text("Error"));
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
          }
        }
    );
  }

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
          Text("Please enter an OTP verification code which is sent to your mobile number"+widget._phone,
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold,),
          ),
          SizedBox(height: 40,),
          TextField(
            controller:_otpController ,
            textInputAction: TextInputAction.done,
            maxLength: 6,
            style: TextStyle(fontSize: 20,letterSpacing: 35,color: Colors.green,fontWeight: FontWeight.bold),
            maxLengthEnforced: true,
            showCursor: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              counterText: "",
              hintText: "------",
              hintStyle: TextStyle(fontSize: 20,letterSpacing: 35,color: Colors.green,fontWeight: FontWeight.bold),
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
        onPressed: (){
          setState(() {

          });
        },
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
    print("build Complete");
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
