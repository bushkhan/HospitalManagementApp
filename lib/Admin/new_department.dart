import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';

class NewDepartment extends StatefulWidget {
  @override
  NewDepartmentState createState() => NewDepartmentState();
}

class NewDepartmentState extends State<NewDepartment> {
  String _name, _description;
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
                                'Add New Department',
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
                                'Enter Department Name',
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
                                'Select Status',
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
                                controller: Status,
                                hintText: 'Select Option',
                                enabled: true,
                                items: status,
                                itemsVisibleInDropdown: 2,
                                onValueChanged: (value) {
                                  setState() {
                                    selectStatus = value;
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 18.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Enter Description',
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
                                onSaved: (String description) {
                                  _description = description;
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

String selectStatus = "";

final Status = TextEditingController();

List<String> status = [
  'Active',
  'Inactive',
];
