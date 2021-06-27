import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Calling_List extends StatefulWidget {
  @override
  _Calling_ListState createState() => _Calling_ListState();
}

class _Calling_ListState extends State<Calling_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        centerTitle: true,
        title: Text(
          'Emergency Number',
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
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.s,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '101',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontFamily: 'Kumbh Sans'),
                                ),
                                Text(
                                  'Ambulance',
                                  style: TextStyle(
                                      fontSize: 12.7,
                                      color: Colors.grey.shade600,
                                      fontFamily: 'Kumbh Sans'),
                                ),
                              ],
                            ),
                            Container(
                              width: 56,
                              height: 55.0,
                              margin: EdgeInsets.only(
                                  top: 5.0, right: 8.0, bottom: 5.0),
                              child: FlatButton(
                                //  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                onPressed: () {
                                  customLaunch('tel:101');
                                },
                                color: Colors.green.shade800,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.s,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '8079445689',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontFamily: 'Kumbh Sans'),
                                ),
                                Text(
                                  'Chemist',
                                  style: TextStyle(
                                      fontSize: 12.7,
                                      color: Colors.grey.shade600,
                                      fontFamily: 'Kumbh Sans'),
                                ),
                              ],
                            ),
                            Container(
                              width: 56,
                              height: 55.0,
                              margin: EdgeInsets.only(
                                  top: 5.0, right: 8.0, bottom: 5.0),
                              child: FlatButton(
                                //  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                onPressed: () {
                                  customLaunch1('tel:7039430079');
                                },
                                color: Colors.green.shade800,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.s,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '9123006744',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontFamily: 'Kumbh Sans'),
                                ),
                                Text(
                                  'Receptionist',
                                  style: TextStyle(
                                      fontSize: 12.7,
                                      color: Colors.grey.shade600,
                                      fontFamily: 'Kumbh Sans'),
                                ),
                              ],
                            ),
                            Container(
                              width: 56,
                              height: 55.0,
                              margin: EdgeInsets.only(
                                  top: 5.0, right: 8.0, bottom: 5.0),
                              child: FlatButton(
                                //  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                onPressed: () {
                                  customLaunch('tel:7039430079');
                                },
                                color: Colors.green.shade800,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void customLaunch(String command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('Could Not Launch $command');
    }
  }

  void customLaunch1(String command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('Could Not Launch $command');
    }
  }

  void customLaunch2(String command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('Could Not Launch $command');
    }
  }
}
