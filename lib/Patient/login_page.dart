import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_app/Admin/admin_home_screen.dart';
import 'package:hospital_management_app/Doctor/doctor_homescreen.dart';
import 'package:hospital_management_app/Patient/register_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hive/hive.dart';
import 'bottomnavibar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _user;

  List patientData = [];
  List doctorData = [];
  List adminData = [];
  bool isLoading = false;

  TextEditingController User = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  PatientData() async {}

  Box dataBox;

  UserLogin() {
    if (User.text == "Patient") {
      patientLogin();
      fetchUser();
    } else if (User.text == "Doctor") {
      doctorLogin();
      fetchDoctor();
    } else if (User.text == "Admin") {
      adminLogin();
      fetchAdmin();
    }
  }

  final snackBar = SnackBar(
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    content: Text(
      'User Logged In Successfully',
      style: TextStyle(color: Colors.black),
    ),
  );

  final snackBar1 = SnackBar(
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    content: Text(
      'User LogIn Failed',
      style: TextStyle(color: Colors.black),
    ),
  );
  Future patientLogin() async {
    var url = "http://hospitalmanagement.educationhost.cloud/patientlogin.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
      "password": _password.text,
    });
    var data = jsonDecode(response.body);
    if (data == "logged in") {
      //
      print(dataBox.get('name'));

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => navBar()),
          (Route<dynamic> route) => false);
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print(response.body);
      return ScaffoldMessenger.of(context).showSnackBar(snackBar1);
    }
  }

  Future adminLogin() async {
    var url = "http://hospitalmanagement.educationhost.cloud/adminlogin.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
      "password": _password.text,
    });
    var data = jsonDecode(response.body);
    if (data == "logged in") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      print(response.body);
    }
  }

  Future doctorLogin() async {
    var url = "http://hospitalmanagement.educationhost.cloud/doctorlogin.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
      "password": _password.text,
    });
    var data = jsonDecode(response.body);
    if (data == "logged in") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorHomeScreen(),
        ),
      );
    } else {
      print(response.body);
    }
  }

  var id;
  var name;
  var Email;
  var mobile;
  var age;
  var qualification;

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/patientlogindata.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        patientData = items;
        isLoading = false;
        id = patientData[0]['id'];
        name = patientData[0]['name'];
        Email = patientData[0]['email'];
        mobile = patientData[0]['mobile'];
        age = patientData[0]['age'];

        dataBox.put('id', id);
        dataBox.put('name', name);
        dataBox.put('email', Email);
        dataBox.put('mobile', mobile);
        dataBox.put('age', age);
        dataBox.put('type', 'User');
      });
    } else {
      patientData = [];
      isLoading = false;
    }
  }

  fetchDoctor() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/doctorlogindata.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        doctorData = items;
        isLoading = false;
        id = doctorData[0]['id'];
        name = doctorData[0]['name'];
        Email = doctorData[0]['email'];
        mobile = doctorData[0]['mobile'];
        age = doctorData[0]['age'];
        qualification = doctorData[0]['degree'];

        dataBox.put('id', id);
        dataBox.put('name', name);
        dataBox.put('email', Email);
        dataBox.put('mobile', mobile);
        dataBox.put('age', age);
        dataBox.put('qualification', qualification);
        dataBox.put('type', 'Doctor');
      });
    } else {
      doctorData = [];
      isLoading = false;
    }
  }

  fetchAdmin() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/adminlogindata.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        adminData = items;
        isLoading = false;
        id = adminData[0]['id'];
        name = adminData[0]['name'];
        Email = adminData[0]['email'];

        dataBox.put('id', id);
        dataBox.put('name', name);
        dataBox.put('email', Email);
        dataBox.put('type', 'Admin');
      });
    } else {
      adminData = [];
      isLoading = false;
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    dataBox = Hive.box("logindata");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Kumbh Sans',
                          color: Colors.blue),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0, left: 12.0),
                        child: Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: 'Kumbh Sans',
                          ),
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          ' Sign Up!',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.0,
                            fontFamily: 'Kumbh Sans',
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegistrationPage();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'User ',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: DropDownField(
                      hintStyle:
                          TextStyle(fontFamily: 'Kumbh Sans', fontSize: 16.0),
                      controller: User,
                      hintText: 'Select Option',
                      //  textStyle: TextStyle( color: Colors.white),
                      enabled: true,
                      items: user,
                      itemsVisibleInDropdown: 3,
                      onValueChanged: (user) {
                        setState() {
                          selectUser = user;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
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
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
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
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontFamily: 'Kumbh Sans', fontSize: 16.0)),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter Email";
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.]+@[a-zA-Z0-9.-]+.[a-z]")
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
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child:
                        // Text('Password',
                        //     style: TextStyle(fontFamily: 'Kumbh Sans', fontSize: 17.0)),
                        Text(
                      'Password',
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
                      controller: _password,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontFamily: 'Kumbh Sans', fontSize: 16.0)),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(height: 30.0),
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
                            UserLogin();
                          });
                        } else {
                          print("Unsuccessful");
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Kumbh Sans',
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String selectUser = "";
final users = TextEditingController();
List<String> user = [
  'Patient',
  'Doctor',
  'Admin',
];
