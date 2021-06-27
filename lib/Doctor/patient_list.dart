import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:hospital_management_app/Admin/department_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientList extends StatefulWidget {
  @override
  PatientListState createState() => PatientListState();
}

class PatientListState extends State<PatientList> {
  List users = [];
  bool isLoading = false;
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://hospitalmanagement.educationhost.cloud/patientlist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        users = items;
        isLoading = false;
      });
    } else {
      users = [];
      isLoading = false;
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 65.0,
          centerTitle: true,
          title: Text(
            'Patients List',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontFamily: 'Kumbh Sans',
            ),
          ),
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
        ),
        body: listBody());
  }

  void choiceAction(String choice) {
    print("working");
  }

  Widget listBody() {
    return ListView.builder(
        itemCount: users.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return patientCard(users[index]);
        });
  }

  Widget patientCard(item) {
    var name = item['name'];
    var phone = item['mobile'];
    var email = item['email'];
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Kumbh Sans'),
                  ),
                  SizedBox(
                    width: 45.0,
                  ),
                  Text(
                    'Mobile',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Kumbh Sans'),
                  ),
                  SizedBox(
                    width: 65.0,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Kumbh Sans'),
                  ),
                  SizedBox(
                    width: 34.0,
                  ),
                  PopupMenuButton<String>(
                    onSelected: choiceAction,
                    itemBuilder: (BuildContext context) {
                      return Constants.choices.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(
                            choice,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                                fontFamily: 'Kumbh Sans'),
                          ),
                        );
                      }).toList();
                    },
                  )
                ],
              ),
              DottedLine(
                dashColor: Colors.grey.shade900,
                lineThickness: 0.5,
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.5,
                        fontFamily: 'Kumbh Sans-Regular',
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      phone,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.5,
                          fontFamily: 'Kumbh Sans-Regular',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      email,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.5,
                          fontFamily: 'Kumbh Sans-Regular',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
