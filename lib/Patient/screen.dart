import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'file:///C:/Users/Bushra%20Khan/AndroidStudioProjects/hospital_management_app/lib/Patient/register_page.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color(0xFF2663E2),

      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/splashscreen.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        //  margin: EdgeInsets.only(top: 360.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 360.0,
            ),
            Text(
              "CARE & CURE HOSPITAL",
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Nunito-Bold',
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 0, bottom: 0, left: 15.0, right: 15.0),
              width: double.infinity,
              child: RaisedButton(
                elevation: 5.0,
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color(0xFF6DD8D2),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegistrationPage();
                      },
                    ),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 0, bottom: 10, left: 15.0, right: 15.0),
              width: double.infinity,
              child: RaisedButton(
                elevation: 5.0,
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color(0xFF6DD8D2),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
