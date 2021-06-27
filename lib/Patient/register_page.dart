import 'dart:convert';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'email_confirmation.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String _name, _email, _phone, _age, selectGender;

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController Gender = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController _password = TextEditingController();

  TextEditingController _confirmpassword = TextEditingController();

  Future register() async {
    var url =
        Uri.parse("http://hospitalmanagement.educationhost.cloud/register.php");
    var response = await http.post(
      url,
      body: {
        "name": name.text,
        "age": age.text,
        "email": email.text,
        "password": _password.text,
        "gender": Gender.text,
        "mobile": phone.text,
      },
    );

    print(Gender.text);
    var data = json.decode(response.body);
    if (data == 400) {
      final snackBar = SnackBar(
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        content: Text(
          'User with this Email already exists',
          style: TextStyle(color: Colors.black),
        ),
      );
    } else if (response.body == 200) {
      final snackBar = SnackBar(
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        content: Text(
          'User Registered Successfully',
          style: TextStyle(color: Colors.black),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background1.png"), fit: BoxFit.cover),
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15.0, top: 38.0),
                          child: Text(
                            'Welcome,',
                            style: TextStyle(
                                fontSize: 28.0,
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kumbh Sans',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Already have an account?',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16.0,
                                  fontFamily: 'Kumbh Sans',
                                ),
                              ),
                              Container(
                                child: FlatButton(
                                  child: Text(
                                    'Sign In!',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16.0,
                                      fontFamily: 'Kumbh Sans',
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return LoginPage();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 10),
                          child: Text(
                            'Name ',
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
                                blurRadius: 3.0,
                                spreadRadius: 3.0,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: name,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontFamily: 'Kumbh Sans', fontSize: 16.0)),
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
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Email ',
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
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontFamily: 'Kumbh Sans', fontSize: 16.0)),
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
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Mobile ',
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
                            controller: phone,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontFamily: 'Kumbh Sans', fontSize: 16.0)),
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
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Gender ',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          margin: EdgeInsets.only(left: 12.0, right: 14.0),
                          child: DropDownField(
                            controller: Gender,
                            hintText: 'Select Option',
                            hintStyle: TextStyle(
                                fontFamily: 'Kumbh Sans', fontSize: 16.0),
                            enabled: true,
                            items: _gender,
                            itemsVisibleInDropdown: 2,
                            onValueChanged: (gender) {
                              setState() {
                                selectGender = gender;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 15.0),
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
                            controller: age,
                            // obscureText: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontFamily: 'Kumbh Sans', fontSize: 16.0)),
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
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Password ',
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
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Confirm Password ',
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
                            controller: _confirmpassword,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontFamily: 'Kumbh Sans', fontSize: 16.0)),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please Enter Phone Number";
                              }
                              if (_password.text != _confirmpassword.text) {
                                return "Password Do Not Match";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 34.0),
                        Container(
                          margin: EdgeInsets.only(
                              top: 0, bottom: 0, left: 15.0, right: 13.0),
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
                                  register();

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Otp_Page(),
                                    ),
                                  );
                                });
                              } else {
                                print("Unsuccessful");
                              }
                            },
                            child: Text(
                              'Sign Up',
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
            ],
          ),
        ),
      ],
    );
  }

  final gender = TextEditingController();

  List<String> _gender = [
    'Male',
    'Female',
  ];
}
