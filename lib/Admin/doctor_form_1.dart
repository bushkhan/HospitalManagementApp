import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'doctor_form_2.dart';
import 'package:transition/transition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class DoctorForm1 extends StatefulWidget {
  @override
  _DoctorForm1State createState() => _DoctorForm1State();
}

class _DoctorForm1State extends State<DoctorForm1> {
  String _name, _email, _phone;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();

  Future doctorDetails() async {
    var url = Uri.parse(
        "http://hospitalmanagement.educationhost.cloud/doctorform1.php");
    var response = await http.post(
      url,
      body: {
        "name": name.text,
        "email": email.text,
        "mobile": phone.text,
        "age": age.text,
        "gender": gender.text,
        "password": password.text,
      },
    );

    print(gender.text);
    print(response.body);
    var data = json.decode(response.body);
    if (data == "error") {
      Fluttertoast.showToast(
        msg: 'Record Insertion Failed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.yellow,
      );
    } else {}
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
          body: ListView(
            children: [
              Form(
                key: _formkey,
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
                          padding: const EdgeInsets.only(left: 15.0, top: 1.0),
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
                          child: TextField(
                            controller: age,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
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
                            controller: gender,
                            hintText: 'Select Option',
                            enabled: true,
                            items: _gender,
                            itemsVisibleInDropdown: 2,
                            onValueChanged: (value) {
                              setState() {
                                // selectGender = value;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 18.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Password',
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
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
                            // controller: _password,
                            obscureText: true,
                            controller: password,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please Enter Password";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 250.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFF6CD8D2).withOpacity(.9),
                                        Color(0xFF6CD8D2).withOpacity(.4),
                                      ],
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: transitionButton(
                                      transitionEffect:
                                          TransitionEffect.RIGHT_TO_LEFT,
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
      ],
    );
  }

  Widget transitionButton({TransitionEffect transitionEffect, String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (_formkey.currentState.validate()) {
            doctorDetails();
            Navigator.push(
                context,
                Transition(
                    child: DoctorForm2(
                      name: name.text,
                    ),
                    transitionEffect: transitionEffect));
          } else {
            Fluttertoast.showToast(
                fontSize: 20.0,
                msg: 'Some Fields Are Empty',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.yellow);
          }
        },
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          maxRadius: 28.0,
          child: Icon(
            FontAwesomeIcons.arrowRight,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  final Gender = TextEditingController();

  List<String> _gender = [
    'Male',
    'Female',
  ];
}
