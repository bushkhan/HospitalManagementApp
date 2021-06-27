import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:hospital_management_app/Patient/past.dart';

class DoctorPast extends StatefulWidget {
  @override
  _DoctorPastState createState() => _DoctorPastState();
}

class _DoctorPastState extends State<DoctorPast> {
  Box dataBox;
  var name;

  var id;
  var selectedfile;

  Response response;
  String progress;
  Dio dio = new Dio();

  List doctorpast = [];
  bool isLoading = false;
  selectFile() async {
    selectedfile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: [
        'jpeg',
        'png',
        'jpg',
        'pdf',
      ],
      //allowed extension to choose
    );
    setState(() {});
  }

  uploadFile() async {
    String uploadurl =
        "http://hospitalmanagement.educationhost.cloud/doctorfileupload.php";
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(selectedfile.path,
          filename: basename(selectedfile.path)
          //show only filename from path
          ),
      "id": id,
    });

    response = await dio.post(
      uploadurl,
      data: formdata,
    );
    if (response.statusCode == 200) {
      print("hi");
      //print response from server
    } else {
      print("Error during connection to server.");
    }
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://hospitalmanagement.educationhost.cloud/doctor_past.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": name,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        doctorpast = items;
        isLoading = false;
      });
    } else {
      doctorpast = [];
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
      body: listBody(),
    );
  }

  Widget listBody() {
    if (doctorpast.contains(null) || doctorpast.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: doctorpast.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return doctorCard2(doctorpast[index], context);
        });
  }

  Widget doctorCard2(items, context) {
    var patient = items['patient_name'];
    var date = items['appointment_date'];
    var time = items['appointment_time'];
    var doctor = items['doctor_name'];
    var department = items['doctor_department'];
    var file =
        "http://hospitalmanagement.educationhost.cloud/" + items['report'];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
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
                        'Disease',
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
                    width: 30.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 40.0,
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
                        child: Center(
                          child: Text(
                            'See Report',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontFamily: 'Kumbh Sans'),
                            textAlign: TextAlign.center,
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
                        onPressed: () async {
                          id = items['req_id'];
                          selectFile();
                          print(id);
                          await uploadFile();
                        },
                        color: Color(0xFF265ED7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Center(
                          child: Text(
                            "Upload Report",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontFamily: 'Kumbh Sans'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
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
