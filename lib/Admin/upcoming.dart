import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dotted_line/dotted_line.dart';
import 'package:hospital_management_app/Admin/past.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminUpcoming extends StatefulWidget {
  @override
  AdminUpcomingState createState() => AdminUpcomingState();
}

class AdminUpcomingState extends State<AdminUpcoming> {
  var id;

  List upcoming = [];
  bool isLoading = false;
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/admin_upcoming.php";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        upcoming = items;
        isLoading = false;
      });
    } else {
      upcoming = [];
      isLoading = false;
    }
  }

  deleteUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://hospitalmanagement.educationhost.cloud/past.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    print(response.body);
    if (response.statusCode == 200) {
      print("done");
    } else {}
  }

  patientCancel() async {
    var url = "http://hospitalmanagement.educationhost.cloud/patientcancel.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    print(response.body);
    if (response.statusCode == 200) {
      print("success");
      fetchUser();
    } else {
      print("failure");
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
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

  void choiceAction(String choice) {
    print("working");
  }

  Widget listBody() {
    if (upcoming.contains(null) || upcoming.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: upcoming.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return upcomingCard(upcoming[index]);
        });
  }

  Widget upcomingCard(items) {
    var date = items['appointment_date'];
    var time = items['appointment_time'];

    var doctor = items['doctor_name'];

    var department = items['doctor_department'];

    return Card(
      margin: EdgeInsets.all(14.0),
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
                    width: 75.0,
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
                    width: 65.0,
                  ),
                  Text(
                    'Doctor ',
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

                SizedBox(
                  width: 0.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
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
                Padding(
                  padding: const EdgeInsets.only(right: 35.0),
                  child: Text(
                    doctor,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.5,
                        fontFamily: 'Kumbh Sans-Regular',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            DottedLine(
              dashColor: Colors.grey,
              lineThickness: 0.5,
            ),
            SizedBox(
              height: 17.0,
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
                  width: 16.0,
                ),
                Expanded(
                  child: Container(
                    height: 40.0,
                    margin: EdgeInsets.only(top: 10.0),
                    child: FlatButton(
                      //  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      onPressed: () {
                        id = items['req_id'];

                        patientCancel();
                      },
                      color: Colors.red.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontFamily: 'Kumbh Sans'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
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
                          "Clear",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontFamily: 'Kumbh Sans'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
