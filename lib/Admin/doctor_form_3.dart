import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hospital_management_app/Patient/confirmation.dart';
import 'package:path/path.dart';
import 'dart:io';

class DoctorForm3 extends StatefulWidget {
  @override
  final name;

  const DoctorForm3({Key key, this.name}) : super(key: key);
  _DoctorForm3State createState() => _DoctorForm3State();
}

class _DoctorForm3State extends State<DoctorForm3> {
  TextEditingController description = TextEditingController();

  var selectedfile;
  var selectedfile1;
  Response response;
  String progress;
  Dio dio = new Dio();

  selectFile() async {
    selectedfile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'png', 'jpg', 'pdf', 'mp4'],
      //allowed extension to choose
    );
    setState(() {});
  }

  selectFile1() async {
    selectedfile1 = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'png', 'jpg'],
      //allowed extension to choose
    );
    setState(() {});
  }

  uploadFile() async {
    String uploadurl =
        "http://hospitalmanagement.educationhost.cloud/fileupload.php";
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(selectedfile.path,
          filename: basename(selectedfile.path)
          //show only filename from path
          ),
      "name": widget.name,
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

  uploadImage() async {
    String uploadurl =
        "http://hospitalmanagement.educationhost.cloud/imageupload.php";
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(selectedfile1.path,
          filename: basename(selectedfile1.path)
          //show only filename from path
          ),
      "name": widget.name,
    });

    response = await dio.post(uploadurl, data: formdata);
    if (response.statusCode == 200) {
      //print response from server
    } else {
      print("Error during connection to server.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/doctorform_bg.png"),
                fit: BoxFit.cover),
          ),
          child: null,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Form(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Add New Doctor',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 27.0,
                                fontFamily: 'Kumbh Sans',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, top: 1.0),
                            child: Row(
                              children: [
                                Text(
                                  'Fill the advanced details',
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 16.0,
                                    fontFamily: 'Kumbh Sans',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 60.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [
                                Text(
                                  'FILE UPLOAD: ',
                                  style: TextStyle(
                                      fontFamily: 'Kumbh Sans',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.5),
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Container(
                                  child: RaisedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        selectFile();
                                      });
                                    },
                                    icon: Icon(Icons.folder_open),
                                    label: Text("CHOOSE FILE"),
                                    color: Color(0xFF3C6FDE),
                                    colorBrightness: Brightness.dark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [
                                Text(
                                  'IMAGE UPLOAD: ',
                                  style: TextStyle(
                                      fontFamily: 'Kumbh Sans',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.5),
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Container(
                                  child: RaisedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        selectFile1();
                                      });
                                    },
                                    icon: Icon(Icons.folder_open),
                                    label: Text("CHOOSE FILE"),
                                    color: Color(0xFF3C6FDE),
                                    colorBrightness: Brightness.dark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 320.0,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  alignment: FractionalOffset.center,
                                  margin: EdgeInsets.only(left: 110.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 35.0),
                                        child: Icon(
                                          FontAwesomeIcons.arrowLeft,
                                          size: 18.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 30.0),
                                          child: Text(
                                            "Previous",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: 'Kumbh Sans'),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 25.0),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  child: InkWell(
                                    onTap: () async {
                                      await uploadFile();
                                      await uploadImage();
                                      setState(() {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Confirmation();
                                        }));
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF6CD8D2).withOpacity(.9),
                                            Color(0xFF6CD8D2).withOpacity(.4),
                                          ],
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          maxRadius: 35.0,
                                          child: Icon(
                                            FontAwesomeIcons.arrowRight,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
