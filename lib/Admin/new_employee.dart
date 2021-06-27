import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';

class Employee extends StatelessWidget {
  String _name, _phone, _age;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/doctorform_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Add New Employee',
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
                    SizedBox(height: 18.0),
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
                            return;
                          } else {
                            print("Unsuccessful");
                          }
                          setState() {}
                          ;
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
            ],
          ),
        ),
      ),
    );
  }

  String selectGender = "";

  final Gender = TextEditingController();

  List<String> gender = [
    'Male',
    'Female',
  ];
}
