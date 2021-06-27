import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hospital_management_app/Doctor/doctor_past.dart';
import 'package:hospital_management_app/Doctor/doctor_upcoming.dart';
import 'file:///C:/Users/Bushra%20Khan/AndroidStudioProjects/hospital_management_app/lib/Patient/past.dart';
import 'package:hospital_management_app/Patient/upcoming.dart';
import 'package:hospital_management_app/Patient/upcoming.dart';
import 'package:hospital_management_app/Doctor/upcoming.dart';

class DoctorAppointments extends StatefulWidget {
  @override
  DoctorAppointmentsState createState() => DoctorAppointmentsState();
}

class DoctorAppointmentsState extends State<DoctorAppointments>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'My Appointment',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontFamily: 'Kumbh Sans'),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            bottom: TabBar(
              controller: controller,
              labelColor: Colors.black,
              indicatorColor: Color(0xFF265ED7),
              indicatorWeight: 3.0,
              unselectedLabelColor: Colors.grey.shade400,
              tabs: [
                Tab(
                  text: 'Upcoming',
                ),
                Tab(
                  text: 'Past',
                ),
              ],
            ),
          ),
          body: TabBarView(controller: controller, children: [
            DoctorUpcoming(),
            DoctorPast(),
          ])),
    );
  }
}
