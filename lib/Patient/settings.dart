import 'package:flutter/material.dart';
import 'package:hospital_management_app/Patient/login_page.dart';
import 'package:hospital_management_app/Patient/patient_profile.dart';
import 'package:hospital_management_app/Patient/aboutus.dart';
import 'my_appointment_page.dart';
import 'package:hive/hive.dart';

class SettingList extends StatefulWidget {
  @override
  _SettingListState createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  @override
  Box dataBox;
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBox = Hive.box("logindata");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontFamily: 'Kumbh Sans'),
        ),
        actions: [
          Icon(Icons.notifications_active_outlined),
        ],
        centerTitle: true,
      ),
      body: getListView(),
    );
  }

  Widget getListView() {
    var List = ListView(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PatientProfile(),
              ),
            );
          },
          child: ListTile(
            leading: Icon(
              Icons.account_circle_sharp,
              size: 36.0,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'Kumbh Sans-Regular',
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyAppointmentPage(),
              ),
            );
          },
          child: ListTile(
            leading: Icon(
              Icons.calendar_today,
              size: 30.0,
            ),
            title: Text(
              'My Appointments',
              style: TextStyle(
                fontFamily: 'Kumbh Sans-Regular',
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Aboutus(),
              ),
            );
          },
          child: ListTile(
            leading: Icon(
              Icons.add_business_rounded,
              size: 36.0,
            ),
            title: Text(
              'About Us',
              style: TextStyle(
                fontFamily: 'Kumbh Sans-Regular',
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              dataBox.delete('id');
              dataBox.delete('name');
              dataBox.delete('email');

              setState(() {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              });
            });
          },
          child: ListTile(
            leading: Icon(
              Icons.logout,
              size: 30.0,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontFamily: 'Kumbh Sans-Regular',
              ),
            ),
          ),
        ),
      ],
    );
    return List;
  }
}
