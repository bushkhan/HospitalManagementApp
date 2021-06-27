import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

import 'doctor_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DepartmentDetails extends StatefulWidget {
  @override
  DepartmentDetailsState createState() => DepartmentDetailsState();
}

class DepartmentDetailsState extends State<DepartmentDetails> {
  @override
  List department = [];
  bool isLoading = false;
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://hospitalmanagement.educationhost.cloud/departments.php";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        department = items;
        isLoading = false;
      });
    } else {
      department = [];
      isLoading = false;
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        centerTitle: true,
        title: Text(
          'Department List',
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
      body: listBody(),
    );
  }

  void choiceAction(String choice) {
    print("working");
  }

  Widget listBody() {
    if (department.contains(null) || department.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: department.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return departmentCard(department[index]);
        });
  }

  Widget departmentCard(items) {
    var name = items['name'];
    var status = items['status'];
    var description = items['description'];
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Dept Name',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Kumbh Sans'),
                  ),
                  SizedBox(
                    width: 28.0,
                  ),
                  Text(
                    'Status',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Kumbh Sans'),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Kumbh Sans'),
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.more_vert,color: Colors.black,),
                  //   onPressed: (){},
                  // ),
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
              SizedBox(
                height: 10.0,
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
                  // SizedBox(
                  //   width: 75.0,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      status,
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
                  SizedBox(
                    width: 30.0,
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Text(
                        description,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14.5,
                            fontFamily: 'Kumbh Sans-Regular',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
