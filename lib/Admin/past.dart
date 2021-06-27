import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:hive/hive.dart';
import 'package:hospital_management_app/Patient/past.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminPast extends StatefulWidget {
  final date;
  final time;
  const AdminPast({Key key, this.date, this.time}) : super(key: key);

  @override
  AdminPastState createState() => AdminPastState();
}

class AdminPastState extends State<AdminPast> {
  Box dataBox;
  var name;

  List patientPast = [];
  bool isLoading = false;

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://hospitalmanagement.educationhost.cloud/admin_past.php";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        patientPast = items;
        isLoading = false;
      });
    } else {
      patientPast = [];
      isLoading = false;
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    dataBox = Hive.box("logindata");
    name = dataBox.get('name');
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: listBody(),
      ),
    );
  }

  Widget listBody() {
    if (patientPast.contains(null) || patientPast.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: patientPast.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return patientCard(patientPast[index]);
        });
  }

  Widget patientCard(items) {
    var patient = items['patient_name'];
    var date = items['appointment_date'];
    var time = items['appointment_time'];

    var doctor = items['doctor_name'];

    var department = items['doctor_department'];
    var file =
        "http://hospitalmanagement.educationhost.cloud/" + items['report'];
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Card(
        margin: EdgeInsets.all(7.0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Date',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.5,
                          fontFamily: 'Kumbh Sans'),
                    ),
                    SizedBox(
                      width: 80.0,
                    ),
                    Text(
                      'Time',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.5,
                          fontFamily: 'Kumbh Sans'),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    SizedBox(
                      width: 82.0,
                    ),
                    Text(
                      'Doctor',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.5,
                          fontFamily: 'Kumbh Sans'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.5,
                        fontFamily: 'Kumbh Sans-Regular',
                        fontWeight: FontWeight.w500),
                  ),

                  // SizedBox(
                  //   width: 45.0,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      time,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.5,
                          fontFamily: 'Kumbh Sans-Regular',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),

                  // SizedBox(
                  //   width: 100.0,
                  // ),
                  Text(
                    doctor,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.5,
                        fontFamily: 'Kumbh Sans-Regular',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              DottedLine(
                dashColor: Colors.grey,
                lineThickness: 0.5,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Appointment Type',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.5,
                            fontFamily: 'Kumbh Sans'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        department,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14.5,
                            fontFamily: 'Kumbh Sans-Regular',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 70.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: FlatButton(
                      //  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PDFViewerFromUrl(url: file)));
                      },
                      color: Colors.red.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Text(
                        'Report',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: 'Kumbh Sans'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
