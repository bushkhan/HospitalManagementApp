import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hospital_management_app/Admin/admin_home_screen.dart';
import 'package:hospital_management_app/Patient/bottomnavibar.dart';
import 'package:hospital_management_app/Patient/login_page.dart';

import 'Doctor/doctor_homescreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void startTimer() async {
    Future.delayed(const Duration(milliseconds: 5000), () {
      var dataBox = Hive.box("logindata");
      print(dataBox.get('type'));
      if (dataBox.get('email') != null) {
        if (dataBox.get('type') == 'User') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => navBar()),
              (Route<dynamic> route) => false);
        } else if (dataBox.get('type') == 'Doctor') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DoctorHomeScreen()),
              (Route<dynamic> route) => false);
        } else if (dataBox.get('type') == 'Admin') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false);
        }
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/splashscreen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(left: 24.0, top: 15.0),
            child: Text(
              "CARE & CURE HOSPITAL",
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Kumbh Sans',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
