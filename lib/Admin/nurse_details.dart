import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'doctor_constants.dart';

class NurseDetails extends StatefulWidget {
  @override
  NurseDetailsState createState() => NurseDetailsState();
}

class NurseDetailsState extends State<NurseDetails> {
  List nurse = [];
  bool isLoading = false;
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://hospitalmanagement.educationhost.cloud/nurselist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        nurse = items;
        isLoading = false;
      });
    } else {
      nurse = [];
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
        toolbarHeight: 70.0,
        centerTitle: true,
        title: Text(
          'Nurse List',
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
    return ListView.builder(
        itemCount: nurse.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return patientCard(nurse[index]);
        });
  }

  Widget patientCard(item) {
    var name = item['name'];
    var designation = item['designation'];
    var department = item['department'];
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
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  // SizedBox(width: 50,),

                  Padding(
                    padding: const EdgeInsets.only(left: 34.0),
                    child: Text(
                      'Degisnation',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Kumbh Sans'),
                    ),
                  ),

                  // SizedBox(width: 28.4,),
                  // SizedBox(
                  //   width: 90.0,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: Text(
                      'Department',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Kumbh Sans'),
                    ),
                  ),
                  SizedBox(
                    width: 0,
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
                                fontSize: 15,
                                color: Colors.black,
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      designation,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.5,
                        fontFamily: 'Kumbh Sans-Regular',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 27.0),
                    child: Text(
                      department,
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
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
