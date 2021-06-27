import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hospital_management_app/Admin/admin_home_screen.dart';
import 'package:hospital_management_app/Admin/doctor_details.dart';
import 'package:hive/hive.dart';
import 'doc_details.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Box dataBox;
  var name;
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBox = Hive.box("logindata");
    name = dataBox.get('name');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        centerTitle: false,
        title: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Kumbh Sans',
          ),
        ),
        //iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            });
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/green_tick.png"),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    'Record Inserted Successfully',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: 'Kumbh Sans',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => DocDetails()),
                          ModalRoute.withName("/Home"));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                        child: Text(
                      'View Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'Kumbh Sans',
                      ),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFF265ED7),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(6, 2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
