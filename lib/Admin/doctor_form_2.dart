import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transition/transition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'doctor_form_3.dart';

class DoctorForm2 extends StatefulWidget {
  final name;
  const DoctorForm2({Key key, this.name}) : super(key: key);
  @override
  _DoctorForm2State createState() => _DoctorForm2State();
}

class _DoctorForm2State extends State<DoctorForm2> {
  String _deptname;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController department = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController degree = TextEditingController();
  TextEditingController handledPatients = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController reviews = TextEditingController();
  TextEditingController description = TextEditingController();

  Future doctorDetails() async {
    var name = widget.name;
    var url = Uri.parse(
        "http://hospitalmanagement.educationhost.cloud/doctorform2.php");
    var response = await http.post(
      url,
      body: {
        "name": name,
        "department": department.text,
        "designation": designation.text,
        "degree": degree.text,
        "handledPatients": handledPatients.text,
        "experience": experience.text,
        "reviews": reviews.text,
        "description": description.text,
      },
    );

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
    var docName = widget.name;

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
                        SizedBox(height: 50.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Enter Department ',
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
                                return "Please Enter Department Name";
                              }
                              return null;
                            },
                            onSaved: (String deptname) {
                              _deptname = deptname;
                            },
                          ),
                        ),
                        SizedBox(height: 18.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Enter Designation ',
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
                                return "Please Enter Department Name";
                              }
                              return null;
                            },
                            onSaved: (String deptname) {
                              _deptname = deptname;
                            },
                          ),
                        ),
                        SizedBox(height: 18.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Enter Medical Degree ',
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
                            controller: degree,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please Enter Department Name";
                              }
                              return null;
                            },
                            onSaved: (String deptname) {
                              _deptname = deptname;
                            },
                          ),
                        ),
                        SizedBox(height: 18.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Handled Patients ',
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
                            controller: handledPatients,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please Enter Department Name";
                              }
                              return null;
                            },
                            onSaved: (String deptname) {
                              _deptname = deptname;
                            },
                          ),
                        ),
                        SizedBox(height: 18.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Experience ',
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
                            controller: experience,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please Enter Department Name";
                              }
                              return null;
                            },
                            onSaved: (String deptname) {
                              _deptname = deptname;
                            },
                          ),
                        ),
                        SizedBox(height: 18.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Reviews ',
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
                            controller: reviews,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please Enter Department Name";
                              }
                              return null;
                            },
                            onSaved: (String deptname) {
                              _deptname = deptname;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Description: ',
                            style: TextStyle(
                                fontFamily: 'Kumbh Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            // hack textfield height
                            padding: EdgeInsets.only(bottom: 40.0),
                            child: TextField(
                              controller: description,
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: "About",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
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
                                        padding:
                                            const EdgeInsets.only(bottom: 30.0),
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
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
                    child: DoctorForm3(
                      name: widget.name,
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
}

String selectGender = "";

final Gender = TextEditingController();

List<String> gender = [
  'Male',
  'Female',
];
