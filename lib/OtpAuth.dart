import 'package:flutter/material.dart';
import 'package:miniprojectapp/Data.dart';
import 'package:miniprojectapp/HomeScreen.dart';
import 'package:otp_screen/otp_screen.dart';
Data user = new Data();
class OtpAuth extends StatefulWidget {
  OtpAuth(Data obj)
  {
    user=obj;
  }
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpAuth> {
  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "1234") {
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }

  // action to be performed after OTP validation is success
  void moveToNextScreen(context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomeScreen(user)));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body: OtpScreen.withGradientBackground(
            topColor: Colors.green[300],
            bottomColor: Colors.green[700],
            otpLength: 4,
            validateOtp: validateOtp,
            routeCallback: moveToNextScreen,
            themeColor: Colors.white,
            titleColor: Colors.white,
            title: "Phone Number Verification",
            subTitle: "Enter the code sent to +91"+user.getPhone().toString(),
          ),
          ),
    );
  }
}
