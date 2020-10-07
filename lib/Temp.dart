import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _visible = false;
  bool _regvisible=true;

  Widget _buildHeading(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children :[
          Text("Welcome.", style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold)),
        ]
    );
  }
  Widget _buildLoginform(){
    return Visibility(
      visible: _regvisible,
      child: SingleChildScrollView(
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
              Text("Login", style: TextStyle(color:Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              TextField(
                textInputAction: TextInputAction.next,
                maxLength: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.call),
                  prefixText: "+91",
                  labelText: "Mobile No.",
                  counterText: "",
                  labelStyle: TextStyle(fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),

                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                maxLength: 8,
                textInputAction: TextInputAction.done,
                obscureText: !this._visible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.lock),labelText: "Password",
                  labelStyle: TextStyle(fontSize: 18),
                  counterText: "",
                  suffixIcon: IconButton(icon:this._visible ? Icon(Icons.visibility_off): Icon(Icons.visibility),
                    color: this._visible ? Colors.red : Colors.green,
                    onPressed: (){
                      setState(() {
                        this._visible = !this._visible;
                      });
                    },),
                ),
                maxLengthEnforced: true,
              ),
              TextButton(onPressed: (){}, child: Text("Forgot Password?")),
              RaisedButton(onPressed:(){
                // Navigator.push(context, MaterialPageRoute(
                //     builder: (context) => OtpAuth()));
              },
                color: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text("Login", style: TextStyle(fontSize: 20,color: Colors.white),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildRegisterform(){
    return Visibility(
      visible: !_regvisible,
      child: SingleChildScrollView(
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
              Text("Register", style: TextStyle(color:Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              TextField(
                textInputAction: TextInputAction.next,
                maxLength: 20,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.person),
                  labelText: "Name",
                  counterText: "",
                  labelStyle: TextStyle(fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 20,),
              TextField(
                textInputAction: TextInputAction.next,
                maxLength: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.call),
                  prefixText: "+91",
                  labelText: "Mobile No.",
                  counterText: "",
                  labelStyle: TextStyle(fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20,),
              TextField(
                maxLength: 8,
                textInputAction: TextInputAction.done,
                obscureText: !this._visible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.lock),labelText: "Password",
                  labelStyle: TextStyle(fontSize: 18),
                  counterText: "",
                  suffixIcon: IconButton(icon:this._visible ? Icon(Icons.visibility_off): Icon(Icons.visibility),
                    color: this._visible ? Colors.red : Colors.green,
                    onPressed: (){
                      setState(() {
                        this._visible = !this._visible;
                      });
                    },),
                ),
                maxLengthEnforced: true,
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: (){},
                // onPressed:(){
                // Navigator.push(context, MaterialPageRoute(
                //     builder: (context) => OtpAuth()));             },
                color: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text("Register", style: TextStyle(fontSize: 20,color: Colors.white),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildRegisterhere(){
    return Visibility(
      visible: _regvisible,
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("New User ?"),
            TextButton(onPressed: (){
              setState(() {
                _regvisible=false;
              });
            }, child: Text("Register Here"))
          ],
        ),
      ),
    );
  }
  Widget _buildLoginhere(){
    return Visibility(
      visible: !_regvisible,
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Existing User ?"),
            TextButton(onPressed: (){
              setState(() {
                _regvisible=true;
              });
            }, child: Text("Login Here"))
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
                  color: Colors.green,
                ),
                Positioned(
                    top: 30,
                    width: MediaQuery.of(context).size.width,
                    child: _buildHeading()),
                Align(
                    alignment: Alignment(0,0),
                    child: _regvisible ? _buildLoginform() : _buildRegisterform()
                ),
                Positioned(
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: _regvisible ? _buildRegisterhere() : _buildLoginhere()
                ),
              ]
          ),
        )
    );
  }
}