import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class NewNurse extends StatefulWidget {
  @override
  NewNurseState createState() => NewNurseState();
}

class NewNurseState extends State<NewNurse> {
  String _name, _email, _phone, _dept, _designation, _age;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController Gender = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController department = TextEditingController();

  Future nurseDetails() async {
    var url = Uri.parse(
        "http://hospitalmanagement.educationhost.cloud/nursedetails.php");
    var response = await http.post(
      url,
      body: {
        "name": name.text,
        "email": email.text,
        "age": age.text,
        "mobile": phone.text,
        "gender": Gender.text,
        "designation": designation.text,
        "department": department.text,
      },
    );

    print(response.body);
    var data = json.decode(response.body);
    if (data == 400) {
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {}
  }

  final snackBar = SnackBar(
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    content: Text(
      'Record Inserted Successfully',
      style: TextStyle(color: Colors.black),
    ),
  );

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
          body: ListView(
            children: [
              Form(
                key: _formkey,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
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
                                'Add New Nurse',
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
                                    'Fill the general details',
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 16.0,
                                      fontFamily: 'Kumbh Sans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 50.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Username',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              margin: EdgeInsets.only(left: 12.0, right: 12.0),
                              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(6, 2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: name,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Name";
                                  }
                                  return null;
                                },
                                onSaved: (String name) {
                                  _name = name;
                                },
                              ),
                            ),
                            SizedBox(height: 18.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              margin: EdgeInsets.only(left: 12.0, right: 12.0),
                              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                // color: Color(0xFFEFF3F6),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(6, 2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Email";
                                  }
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return "Please Enter Valid Email";
                                  }
                                  return null;
                                },
                                onSaved: (String email) {
                                  _email = email;
                                },
                              ),
                            ),
                            SizedBox(height: 18.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Mobile',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              margin: EdgeInsets.only(left: 12.0, right: 12.0),
                              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(6, 2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: phone,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Phone Number";
                                  }
                                  if (value.length < 9) {
                                    return "Please Enter Valid Phone Number";
                                  }
                                  return null;
                                },
                                onSaved: (String phone) {
                                  _phone = phone;
                                },
                              ),
                            ),
                            SizedBox(height: 18.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Age',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              margin: EdgeInsets.only(left: 15.0, right: 15.0),
                              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(6, 2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                // obscureText: true,
                                controller: age,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontFamily: 'Kumbh Sans',
                                        fontSize: 16.0)),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Age";
                                  }
                                  return null;
                                },
                                onSaved: (String age) {
                                  _age = age;
                                },
                              ),
                            ),
                            SizedBox(height: 18.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Gender',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              margin: EdgeInsets.only(left: 12.0),
                              child: DropDownField(
                                controller: Gender,
                                hintText: 'Select Option',
                                enabled: true,
                                items: gender,
                                itemsVisibleInDropdown: 2,
                                onValueChanged: (value) {
                                  setState() {
                                    selectGender = value;
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 18.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Designation',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              margin: EdgeInsets.only(left: 12.0, right: 12.0),
                              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(6, 2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: designation,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Designation";
                                  }
                                  return null;
                                },
                                onSaved: (String designation) {
                                  _designation = designation;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Department',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              margin: EdgeInsets.only(left: 12.0, right: 12.0),
                              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(6, 2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: department,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please Enter Department";
                                  }
                                  return null;
                                },
                                onSaved: (String department) {
                                  _dept = department;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 0, bottom: 0, left: 15.0, right: 15.0),
                              width: double.infinity,
                              child: RaisedButton(
                                elevation: 5.0,
                                padding: EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                color: Color(0xFF265ED7),
                                onPressed: () {
                                  if (_formkey.currentState.validate()) {
                                    setState(() {
                                      nurseDetails();
                                    });
                                  } else {
                                    print("Unsuccessful");
                                  }
                                },
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kumbh Sans',
                                      fontSize: 16.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String selectGender = "";

final Gender = TextEditingController();

List<String> gender = [
  'Male',
  'Female',
];
