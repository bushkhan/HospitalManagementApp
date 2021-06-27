import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital_management_app/Patient/doctors_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PulmonologyList extends StatefulWidget {
  @override
  PulmonologyListState createState() => PulmonologyListState();
}

class PulmonologyListState extends State<PulmonologyList> {
  @override
  List pulmolist = [];
  bool isLoading = false;
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "http://hospitalmanagement.educationhost.cloud/pulmonologylist.php";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        pulmolist = items;
        isLoading = false;
      });
    } else {
      pulmolist = [];
      isLoading = false;
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Color(0xFFF1F2F3),
      appBar: AppBar(
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
        title: Text(
          'Available Doctors',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Kumbh Sans',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(right: 10.0),
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 9.0, 0.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Pulmonologists',
                    style: TextStyle(
                      fontFamily: 'Kumbh Sans',
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontFamily: 'Kumbh Sans',
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DoctorData();
                    }));
                  });
                },
                child: listBody(),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Available Doctors',
                      style: TextStyle(
                        fontFamily: 'Kumbh Sans',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontFamily: 'Kumbh Sans',
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 17.0,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: EdgeInsets.all(10),
                  width: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Dr. Serena Gome',
                                    style: TextStyle(
                                        fontFamily: 'Kumbh Sans',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  'Eye Specialist',
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontFamily: 'Kumbh Sans',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'Experience',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Kumbh Sans',
                                  ),
                                ),
                                Text('8 Years',
                                    style: TextStyle(fontFamily: 'Kumbh Sans')),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'Patients',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Kumbh Sans'),
                                ),
                                Text('1.01K')
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.all(10),
                          child: Image.asset(
                            'images/d1.png',
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listBody() {
    if (pulmolist.contains(null) || pulmolist.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return ListView.builder(
        itemCount: pulmolist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return pulmocard(pulmolist[index]);
        });
  }

  Widget pulmocard(items) {
    var name = items['name'];
    var designation = items['designation'];
    var reviews = items['reviews'];
    var degree = items['degree'];
    var id = items['id'];
    var image =
        "http://hospitalmanagement.educationhost.cloud/" + items['photo'];

    return Container(
      margin: EdgeInsets.only(left: 9.0, right: 6.0, top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(6, 2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorData(id: id, name: name),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(color: Colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontFamily: 'Kumbh Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Text(
                        designation,
                        style: TextStyle(
                            fontFamily: 'Kumbh Sans',
                            fontSize: 12.0,
                            color: Colors.grey.shade500),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6.0),
                                child: Icon(
                                  FontAwesomeIcons.solidStar,
                                  size: 12.0,
                                  color: Colors.yellow,
                                ),
                              ),
                              SizedBox(
                                width: 7.0,
                              ),
                              Text(
                                reviews,
                                style: TextStyle(
                                    fontFamily: 'Kumbh Sans',
                                    fontSize: 11.8,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          child: Row(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.only(bottom: 3.8),
                              //   child: Icon(
                              //     FontAwesomeIcons.clock,
                              //     size: 12.0,
                              //     color: Colors.green.shade600,
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: 4.0,
                              // ),
                              Text(
                                degree,
                                style: TextStyle(
                                    fontFamily: 'Kumbh Sans',
                                    fontSize: 11.6,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
