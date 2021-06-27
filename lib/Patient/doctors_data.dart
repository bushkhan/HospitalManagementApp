import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/utils.dart';
import 'package:hospital_management_app/Patient/appointment_page.dart';
import 'package:hospital_management_app/Patient/my_appointment_page.dart';
import '../components/bottom_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class DoctorData extends StatefulWidget {
  final id;
  final name;
  const DoctorData({Key key, this.id, this.name}) : super(key: key);
  @override
  _DoctorDataState createState() => _DoctorDataState();
}

class _DoctorDataState extends State<DoctorData> {
  @override
  List data = [];
  bool isLoading = false;

  fetchdata() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://hospitalmanagement.educationhost.cloud/doctordata.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": widget.id,
    });
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        data = items;
        isLoading = false;
      });
      print(response.body);
    } else {
      data = [];
      isLoading = false;
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchdata();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            widget.name,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Kumbh Sans',
            ),
          ),
          centerTitle: true,
        ),
        body: listBody(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
          child: Container(
            height: 53.0,
            margin: EdgeInsets.only(top: 0, bottom: 0, left: 24.0, right: 24.0),
            width: double.infinity,
            child: RaisedButton(
              elevation: 5.0,
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Color(0xFF265ED7),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentPage(
                      id: widget.id,
                      name: widget.name,
                      email: data[0]['email'],
                      department: data[0]['department'],
                      designation: data[0]['designation'],
                    ),
                  ),
                );
              },
              child: Text(
                'Book An Appointment',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Kumbh Sans',
                    fontSize: 16.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void customLaunch(String command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('Could Not Launch $command');
    }
  }

  Widget listBody() {
    if (data.contains(null) || data.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    // return ListView.builder(
    //     itemCount: data.length,
    //     shrinkWrap: true,
    //     itemBuilder: (context, index) {
    //       return cardioCard(cardiolist[index]);
    //     });
    return PageView.builder(itemBuilder: (context, index) {
      return doctorPage(data[index]);
    });
  }

  Widget doctorPage(items) {
    var designation = items['designation'];
    var experience = items['experience'];
    var degree = items['degree'];
    var description = items['description'];
    var name = items['name'];
    var reviews = items['reviews'];
    var patients = items['handled_patients'];

    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          //doctor_image
          Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: Container(
              height: 290.0,
              child: Image.network(
                image,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
              child: Text(
                designation,
                style: TextStyle(
                  fontFamily: 'Kumbh Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4.0),
            child: Text(
              degree,
              style: TextStyle(
                fontFamily: 'Kumbh Sans',
                fontSize: 15.0,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          Container(
            height: 45.0,
            width: 150.0,
            margin: EdgeInsets.only(
                left: 20.0, right: 5.0, top: 20.0, bottom: 30.0),
            child: ButtonTheme(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
                padding: const EdgeInsets.all(10),
                color: Color(0xFF6DD8D2),
                onPressed: () {
                  customLaunch('tel:7039430079');
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Text(
                        'Voice Call',
                        style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15.0),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    'About',
                    style: TextStyle(
                      fontFamily: 'Kumbh Sans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(width: 6.0),
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Kumbh Sans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  )
                ],
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(description),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                doctorQuestions('Patients'),
                doctorQuestions('Experience'),
                doctorQuestions('Review'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 7.0, left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                doctorAnswers(patients),
                doctorAnswers(experience),
                doctorAnswers(reviews),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container doctorQuestions(String textName) {
  return Container(
    child: Text(
      '$textName',
      style: TextStyle(
        fontFamily: 'Kumbh Sans',
        fontSize: 13.0,
        color: Colors.grey.shade600,
      ),
    ),
  );
}

Container doctorAnswers(String textName) {
  return Container(
    child: Text(
      '$textName',
      style: TextStyle(
        fontFamily: 'Kumbh Sans',
        fontSize: 17.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
