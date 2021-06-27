import 'dart:ui';
import 'package:flutter/material.dart';
import 'upcoming.dart';
import 'package:hospital_management_app/Admin/past.dart';

class AppointmentDetails extends StatefulWidget {
  @override
  AppointmentDetailsState createState() => AppointmentDetailsState();
}

class AppointmentDetailsState extends State<AppointmentDetails>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment Details',
          style: TextStyle(
              fontSize: 20.0, color: Colors.black, fontFamily: 'Kumbh Sans'),
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
      body: TabBarView(
        controller: controller,
        children: [
          AdminUpcoming(),
          AdminPast(),
        ],
      ),
    );
  }
}
