import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hospital_management_app/Admin/department_details.dart';
import 'package:hospital_management_app/Admin/new_department.dart';
import 'package:hospital_management_app/Admin/new_nurse.dart';
import 'package:hospital_management_app/Admin/nurse_details.dart';
import 'package:hospital_management_app/Admin/statistics.dart';

import 'package:hospital_management_app/Admin/doctor_details.dart';
import 'package:hospital_management_app/Admin/doctor_form_1.dart';
import 'package:hospital_management_app/Admin/patient_details.dart';
import 'admin_drawer.dart';
import 'new_employee.dart';
import 'appointment_details.dart';
import 'package:hive/hive.dart';
import 'payment_details.dart';

class HomePage extends StatefulWidget {
  final AppBar appBar;
  HomePage({key, this.appBar}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Material MyItems(String path, String heading) {
    return Material(
      color: Colors.white,
      elevation: 5.0,
      borderRadius: BorderRadius.circular(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(17.0),
              child: Image(
                image: AssetImage(path),
              ),
            ),
          ),
          //Text
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 2.0, right: 2.0),
              child: new Text(
                heading,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontFamily: "Kumbh Sans",
                  fontSize: 15.2,
                  color: Colors.black54,
                ),
                maxLines: 2,
              ),
            ),
          ),

          //icons
        ],
      ),
    );
  }

  @override
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
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: MainDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Text(
              'Hello, ',
              style: TextStyle(color: Colors.black, fontFamily: 'Kumbh Sans'),
            ),
            Text(
              name,
              style: TextStyle(color: Colors.black, fontFamily: 'Kumbh Sans'),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 55.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Expanded(child: content(context))
            ],
          ),
        ),
      ),
    );
  }

  Widget dashBg() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/adminbg.png"),
              fit: BoxFit.cover,
            ),
          ),

          // Expanded(
          //   child: Container(color: Colors.transparent),
          //   flex: 5,
          // ),
        ),
        //header(),
      ],
    );
  }

  Widget content(context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        children: <Widget>[
          InkWell(
            child: StatisticsCard(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LineChart(),
                ),
              );
            },
          ),
          grid(context),
        ],
      ),
    );
  }

  Widget grid(context) {
    return Container(
      child: GridView.count(
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        shrinkWrap: true,
        crossAxisSpacing: 18.0,
        mainAxisSpacing: 18.0,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
        children: [
          //StatisticsCard(),
          InkWell(
            child: MyItems("images/d10.png", "Add New Doctor"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorForm1(),
                ),
              );
            },
          ),
          InkWell(
            child: MyItems("images/nurse10.png", "Add New Nurse"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewNurse(),
                ),
              );
            },
          ),
          InkWell(
            child: MyItems("images/department10.png", "Add New Department"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewDepartment(),
                ),
              );
            },
          ),
          InkWell(
            child: MyItems("images/employee10.png", "Add New Employee"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Employee(),
                ),
              );
            },
          ),

          InkWell(
            child: MyItems("images/appointment10.png", "Appointment Details"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointmentDetails(),
                ),
              );
            },
          ),
          InkWell(
            child: MyItems("images/patient10.png", "Patient Details"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PatientDetails()));
            },
          ),

          InkWell(
            child: MyItems("images/doctordetails10.png", "Doctor Details"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorDetails(),
                ),
              );
            },
          ),
          InkWell(
            child: MyItems("images/dep10.png", "Department Details"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DepartmentDetails(),
                ),
              );
            },
          ),
          InkWell(
            child: MyItems("images/payment10.png", "Payment Details"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentDetails(),
                ),
              );
            },
          ),
          InkWell(
            child: MyItems("images/nursedetails10.png", "Nurse Details"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NurseDetails(),
                ),
              );
            },
          ),
        ],
        // staggeredTiles: [
        //   StaggeredTile.extent(2, 220.0),
        //   StaggeredTile.extent(1, 150.0),
        //   StaggeredTile.extent(1, 150.0),
        //   StaggeredTile.extent(1, 150.0),
        //   StaggeredTile.extent(1, 150.0),
        //   StaggeredTile.extent(2, 120.0),
        // ],
      ),
    );
  }
}

class StatisticsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 17, bottom: 10),
      height: 230.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey.shade600,
            offset: new Offset(1.6, 2.0),
            blurRadius: 15.0,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xFF265ED7).withOpacity(.9),
              Color(0xFF265ED7).withOpacity(.2)
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[chartImg, chartText],
        ),
      ),
    );
  }
}

var data = [0.0, 1.0, 0.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

get chartImg => Padding(
      padding: const EdgeInsets.all(30.0),
      child: Sparkline(
        data: data,
        lineColor: Color(0xFF265ED7),
        pointsMode: PointsMode.all,
        pointColor: Colors.black,
        pointSize: 8.0,
      ),
    );

get chartText => Container(
      margin: EdgeInsets.only(left: 22.0, top: 170.0),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: 200.0,
          child: SizedBox(
            width: 250.0,
            child: TypewriterAnimatedTextKit(
              onTap: () {
                print("Tap Event");
              },
              text: [
                "Statistics",
                "Data",
                "And",
                "Charts",
              ],
              textStyle: TextStyle(
                fontSize: 30.0,
                fontFamily: "Kumbh Sans",
                color: Colors.white60.withOpacity(0.7),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
    );
