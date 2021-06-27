import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_app/Patient/login_page.dart';
import 'package:hive/hive.dart';
import 'doctor_profile.dart';

class DoctorDrawer extends StatefulWidget {
  @override
  _DoctorDrawerState createState() => _DoctorDrawerState();
}

class _DoctorDrawerState extends State<DoctorDrawer> {
  Box dataBox;
  var name;
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBox = Hive.box("logindata");
    name = dataBox.get('name');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  Color(0xFF265ED7).withOpacity(.9),
                  Color(0xFF265ED7).withOpacity(.2)
                ],
              ),
            ),
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("images/profile_image.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),

                // SizedBox(
                //   height: 20.0,
                // ),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Kumbh Sans'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black,
              size: 20,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                  fontSize: 19, color: Colors.black, fontFamily: 'Kumbh Sans'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.lock,
              color: Colors.black,
              size: 20,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 19, color: Colors.black, fontFamily: 'Kumbh Sans'),
            ),
            onTap: () {
              dataBox.delete('id');
              dataBox.delete('name');
              dataBox.delete('email');
              Future.delayed(const Duration(milliseconds: 2000), () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              });
            },
          ),
        ],
      ),
    );
  }
}
