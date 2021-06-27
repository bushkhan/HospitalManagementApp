import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_management_app/Patient/login_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Otp_Page extends StatefulWidget {
  @override
  _Otp_PageState createState() => _Otp_PageState();
}

class _Otp_PageState extends State<Otp_Page> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController otp = TextEditingController();

  Future otpVerify() async {
    var url = "http://hospitalmanagement.educationhost.cloud/otp_verify.php";
    var response = await http.post(Uri.parse(url), body: {
      "otp": otp.text,
    });
    var data = jsonDecode(response.body);
    if (data == "Success") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print(response.body);
      return ScaffoldMessenger.of(context).showSnackBar(snackBar1);
    }
  }

  final snackBar = SnackBar(
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    content: Text(
      'Verification Successful',
      style: TextStyle(color: Colors.black),
    ),
  );
  final snackBar1 = SnackBar(
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    content: Text(
      'Enter Valid OTP',
      style: TextStyle(color: Colors.black),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Form(
              key: _formkey,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/doctorform_bg.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 400,
                    ),
                    Center(
                      child: Text(
                        'Verification',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.grey.shade800,
                          fontFamily: 'Kumbh Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'You will get a OTP via Email',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                            fontFamily: 'Kumbh Sans-Regular'),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      maxLength: 4,
                      controller: otp,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter OTP',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    //),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // height: 40,
                      margin: EdgeInsets.only(
                          top: 0, bottom: 0, left: 40.0, right: 40.0),
                      width: double.infinity,
                      child: RaisedButton(
                        //elevation: 5.0,
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Color(0xFF6DD8D2),
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              otpVerify();
                            });
                          } else {
                            print("Unsuccessful");
                          }
                        },
                        child: Text(
                          'Verify and Create Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kumbh Sans',
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
