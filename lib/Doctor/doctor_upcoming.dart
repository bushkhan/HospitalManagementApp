import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctorUpcoming extends StatefulWidget {
  @override
  DoctorUpcomingState createState() => DoctorUpcomingState();
}

class DoctorUpcomingState extends State<DoctorUpcoming> {
  Box dataBox;
  var name;
  var id;
  List doctorupcoming = [];
  bool isLoading = false;
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/doctor_upcoming.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": name,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        doctorupcoming = items;
        isLoading = false;
      });
    } else {
      doctorupcoming = [];
      isLoading = false;
    }
  }

  final snackBar = SnackBar(
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    content: Text(
      'Appointment Completed',
      style: TextStyle(color: Colors.black),
    ),
  );
  deleteUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://hospitalmanagement.educationhost.cloud/past.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    print(response.body);
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (response.statusCode == 200) {
      print("done");
    } else {}
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
      body: listBody(),
    );
  }

  Widget listBody() {
    if (doctorupcoming.contains(null) ||
        doctorupcoming.length < 0 ||
        isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: doctorupcoming.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return doctorCard(doctorupcoming[index]);
        });
  }

  Widget doctorCard(items) {
    var patient = items['patient_name'];
    var date = items['appointment_date'];
    var time = items['appointment_time'];

    var doctor = items['doctor_name'];

    var department = items['doctor_department'];

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
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
                padding: const EdgeInsets.only(top: 5.0),
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
                      width: 95.0,
                    ),
                    Text(
                      'Slot',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.5,
                          fontFamily: 'Kumbh Sans'),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Text(
                      'Patient Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.5,
                          fontFamily: 'Kumbh Sans'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13.0,
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
                  //   width: 75.0,
                  // ),
                  Text(
                    patient,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.5,
                        fontFamily: 'Kumbh Sans-Regular',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              DottedLine(
                dashColor: Colors.grey,
                lineThickness: 0.5,
              ),
              SizedBox(
                height: 14.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        ' Disease',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.5,
                            fontFamily: 'Kumbh Sans'),
                      ),
                      SizedBox(
                        height: 9.0,
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
                    width: 110.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 40.0,
                      margin: EdgeInsets.only(top: 10.0),
                      child: FlatButton(
                        //  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        onPressed: () {
                          id = items["req_id"];
                          deleteUser();
                        },
                        color: Color(0xFF265ED7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Center(
                          child: Text(
                            'Complete',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontFamily: 'Kumbh Sans'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  SizedBox(
                    height: 0.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
