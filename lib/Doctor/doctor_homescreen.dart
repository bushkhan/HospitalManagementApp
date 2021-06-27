import 'package:flutter/material.dart';
import 'package:hospital_management_app/Doctor/doctor_upcoming_past.dart';
import 'package:hospital_management_app/Doctor/patient_list.dart';
import 'package:hospital_management_app/Doctor/doctor_drawer.dart';
import 'package:hive/hive.dart';
import 'package:hospital_management_app/Doctor/upcoming.dart';
import 'package:hospital_management_app/Doctor/past.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctorHomeScreen extends StatefulWidget {
  //final AppBar appBar;
  //HomeScreen({key, this.appBar}) : super(key: key);

  @override
  DoctorHomeScreenState createState() => DoctorHomeScreenState();
}

class DoctorHomeScreenState extends State<DoctorHomeScreen> {
  Box dataBox;
  var name;
  var dateString;
  var aptcount = "0";
  var ptncount = "0";

  List applist = [];
  bool isLoading = false;
  fetchAppointmentCount() async {
    var url =
        "http://hospitalmanagement.educationhost.cloud/appointmentcount.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": name,
    });
    print(response.body);
    setState(() {
      aptcount = response.body.toString();
    });
  }

  fetchPatientCount() async {
    var url = "http://hospitalmanagement.educationhost.cloud/patientcount.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": name,
    });
    print(response.body);
    setState(() {
      ptncount = response.body.toString();
    });
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/todayappointments.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": name,
      "date": "0" + dateString,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        applist = items;
        isLoading = false;
      });
    } else {
      applist = [];
      isLoading = false;
    }
  }

  void initState() {
    // TODO: implement initState

    super.initState();

    var format = DateFormat.yMd();
    dateString = format.format(DateTime.now());
    print(dateString);
    dataBox = Hive.box("logindata");
    name = dataBox.get('name');
    fetchAppointmentCount();
    fetchPatientCount();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        centerTitle: false,
        title: Row(
          children: [
            Text(
              'Dr. ',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Kumbh Sans',
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Kumbh Sans',
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      drawer: DoctorDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 35),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            InkWell(
                              child: Container(
                                height: 62,
                                width: 68,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 6.0),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: Color(0xFF3C6FDE),
                                          size: 35.0,
                                        ),
                                        onPressed: () {
                                          //  setState(){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return Past();
                                            }),
                                          );
                                          //  }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Past',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Kumbh Sans'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 62,
                                width: 68,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 6.0),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: Color(0xFF3C6FDE),
                                          size: 37.0,
                                        ),
                                        onPressed: () {
                                          //setState(){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return Upcoming();
                                            }),
                                          );
                                          //  }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(5),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Upcoming',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Kumbh Sans'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 62,
                              width: 68,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6.0),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.person,
                                        color: Color(0xFF3C6FDE),
                                        size: 35.0,
                                      ),
                                      onPressed: () {
                                        //  setState(){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return PatientList(); //Patients();
                                          }),
                                        );
                                        //  }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Patients',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Kumbh Sans'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 62,
                              width: 68,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.calendar_today,
                                          color: Color(0xFF3C6FDE),
                                          size: 35.0,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DoctorAppointments()),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: Text(
                                'Appointments',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Kumbh Sans'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28.0,
                  ),
                  Row(
                    children: [
                      StatsGridBox(
                        title: 'Total Patients :',
                        count: ptncount,
                      ),
                      StatsGridBox(
                        title: 'Total Appointment :',
                        count: aptcount,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 245, 248, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                'Today Appointments',
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontFamily: 'Kumbh Sans'),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              bottom: 10.0, left: 20.0, right: 20.0),
                          child: listBody(),
                        )
                      ],
                    ),
                    controller: scrollController,
                  ),
                );
              },
              initialChildSize: 0.70,
              minChildSize: 0.60,
              maxChildSize: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget listBody() {
    if (applist.contains(null) || applist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        controller: ScrollController(keepScrollOffset: false),
        itemCount: applist.length,
        itemBuilder: (context, index) {
          return todayAppointments(applist[index]);
        });
  }

  Widget todayAppointments(items) {
    var name = items['patient_name'];
    var time = items['appointment_time'];
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Icon(
              Icons.date_range,
              color: Color(0xFF3C6FDE),
            ),
            padding: EdgeInsets.all(12),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Patient Name:',
                      style: TextStyle(
                          fontSize: 16.4,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Kumbh Sans',
                          color: Colors.grey.shade800),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Kumbh Sans',
                          color: Colors.grey.shade800),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text(
                      'Time :',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Kumbh Sans',
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade800),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Kumbh Sans',
                          color: Colors.grey.shade800),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatsGridBox extends StatelessWidget {
  final title;
  final count;

  const StatsGridBox({
    Key key,
    @required this.title,
    @required this.count,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120.0,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                fontFamily: 'Kumbh Sans',
              ),
            ),
            Text(
              count,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19.0,
                fontFamily: 'Kumbh Sans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
