import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_app/Patient/email_confirmation.dart';
import 'package:hospital_management_app/Patient/payment.dart';
import 'package:hospital_management_app/Patient/table_calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hospital_management_app/components/reusable_card.dart';
import 'package:hospital_management_app/components/bottom_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

enum Slots {
  m1,
  m2,
  m3,
  m4,
  a1,
  a2,
  a3,
  e1,
  e2,
  e3,
  e4,
}

class AppointmentPage extends StatefulWidget {
  final id;
  final name;
  final email;
  final department;
  final designation;
  const AppointmentPage({
    Key key,
    this.id,
    this.name,
    this.email,
    this.department,
    this.designation,
  }) : super(key: key);
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  // CalendarController _controller;
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  DateFormat formatter = DateFormat('MM/dd/yyyy');
  String day;

  var app_time;

  var patientid;
  var patientname;
  var patientemail;

  Slots selectedSlot = Slots.m1;
  bool sc = true;
  bool sc1 = false;
  bool sc2 = false;
  bool sc3 = false;
  bool sc4 = false;
  bool sc5 = false;
  bool sc6 = false;
  bool sc7 = false;
  bool sc8 = false;
  bool sc9 = false;
  bool sc0 = false;

  setColorChange() {
    setState(() {
      sc = false;
      sc1 = false;
      sc2 = false;
      sc3 = false;
      sc4 = false;
      sc5 = false;
      sc6 = false;
      sc7 = false;
      sc8 = false;
      sc9 = false;
      sc0 = false;
    });
  }

  Box dataBox;
  @override
  Future appointment_book() async {
    var url = Uri.parse(
        "http://hospitalmanagement.educationhost.cloud/appointment_booking.php");
    var response = await http.post(
      url,
      body: {
        "patient_id": patientid,
        "patient_name": patientname,
        "patient_email": patientemail,
        "appointment_date": day,
        "appointment_time": app_time,
        "doctor_designation": widget.designation,
        "doctor_department": widget.department,
        "doctor_name": widget.name,
        "doctor_email": widget.email,
      },
    );

    print(response.body);
    var data = json.decode(response.body);
    if (data == 400) {
      print("error");
    } else if (response.statusCode == 200) {}
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    dataBox = Hive.box("logindata");
    patientid = dataBox.get('id');
    patientname = dataBox.get('name');
    patientemail = dataBox.get('email');
    // _controller = CalendarController();
  }

  final snackBar = SnackBar(
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    content: Text(
      'User Logged In Successfully',
      style: TextStyle(color: Colors.black),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            'Appointment',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Kumbh Sans',
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: TabelCalender(),
              ),
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Morning Slots',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kumbh Sans',
                    fontSize: 16.8,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.m1;
                              setColorChange();
                              sc = true;
                              if (sc) {
                                app_time = '10:10 am';
                              }
                            },
                          );
                        },
                        cardChild: Center(
                          child: Text(
                            '10:10 am',
                            style: sc
                                ? TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0)
                                : TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                          ),
                        ),
                        colour: selectedSlot == Slots.m1
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.m2;
                              setColorChange();
                              sc1 = true;
                              if (sc1) {
                                app_time = '10:40 am';
                              }
                            },
                          );
                        },
                        cardChild: Center(
                          child: Text(
                            '10:40 am',
                            style: sc1
                                ? TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0)
                                : TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                          ),
                        ),
                        colour: selectedSlot == Slots.m2
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.m3;
                              setColorChange();
                              sc2 = true;
                              if (sc2) {
                                app_time = '11:00 am';
                              }
                            },
                          );
                        },
                        cardChild: Center(
                          child: Text(
                            '11:00 am',
                            style: sc2
                                ? TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0)
                                : TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                          ),
                        ),
                        colour: selectedSlot == Slots.m3
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.m4;
                              setColorChange();
                              sc9 = true;
                              if (sc9) {
                                app_time = '11:30 am';
                              }
                            },
                          );
                        },
                        cardChild: Center(
                          child: Text(
                            '11:30 am',
                            style: sc9
                                ? TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0)
                                : TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                          ),
                        ),
                        colour: selectedSlot == Slots.m4
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              if (sc2) {
                                app_time = '10:40';
                              }
                            },
                          );
                        },
                        cardChild: Center(child: null),
                        colour: Color(0xFFF1F2F3),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.m3;
                              setColorChange();
                              sc2 = true;
                            },
                          );
                        },
                        cardChild: Center(
                          child: null,
                        ),
                        colour: Color(0xFFF1F2F3),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Afternoon Slots',
                  style: TextStyle(
                    fontFamily: 'Kumbh Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.8,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.a1;
                              setColorChange();
                              sc3 = true;
                              if (sc3) {
                                app_time = '12:05 pm';
                              }
                            },
                          );
                        },
                        cardChild: Center(
                          child: Text(
                            '12:05 pm',
                            style: sc3
                                ? TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0)
                                : TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                          ),
                        ),
                        colour: selectedSlot == Slots.a1
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.a2;
                              setColorChange();
                              sc4 = true;
                              if (sc4) {
                                app_time = '12:30 pm';
                              }
                            },
                          );
                        },
                        cardChild: Center(
                          child: Text(
                            '12:30 pm',
                            style: sc4
                                ? TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0)
                                : TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                          ),
                        ),
                        colour: selectedSlot == Slots.a2
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.a3;
                              setColorChange();
                              sc5 = true;
                              if (sc5) {
                                app_time = '1:15 pm';
                              }
                            },
                          );
                        },
                        cardChild: Center(
                          child: Text(
                            '1:15 pm',
                            style: sc5
                                ? TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0)
                                : TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                          ),
                        ),
                        colour: selectedSlot == Slots.a3
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Evening Slots',
                  style: TextStyle(
                    fontFamily: 'Kumbh Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.8,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.e1;
                              setColorChange();
                              sc6 = true;
                              if (sc6) {
                                app_time = '07:10 pm';
                              }
                            },
                          );
                        },
                        cardChild: Center(
                          child: Text(
                            '7:10 pm',
                            style: sc6
                                ? TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0)
                                : TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                          ),
                        ),
                        colour: selectedSlot == Slots.e1
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.e2;
                              setColorChange();
                              sc7 = true;
                              if (sc7) {
                                app_time = '7:35 pm';
                              }
                            },
                          );
                        },
                        cardChild: Center(
                          child: Text(
                            '7:35 pm',
                            style: sc7
                                ? TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0)
                                : TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                          ),
                        ),
                        colour: selectedSlot == Slots.e2
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.e3;
                              setColorChange();
                              sc8 = true;
                              if (sc8) {
                                app_time = '8:00 pm';
                              }
                            },
                          );
                        },
                        cardChild: Center(
                          child: Text(
                            '8:00 pm',
                            style: sc8
                                ? TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0)
                                : TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                          ),
                        ),
                        colour: selectedSlot == Slots.e3
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.e4;
                              setColorChange();
                              sc0 = true;
                              if (sc0) {
                                app_time = '8:35 pm';
                              }
                            },
                          );
                        },
                        cardChild: Center(
                          child: Text(
                            '8:35 pm',
                            style: sc0
                                ? TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0)
                                : TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                          ),
                        ),
                        colour: selectedSlot == Slots.e4
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {},
                          );
                        },
                        cardChild: Center(child: null),
                        colour: Color(0xFFF1F2F3),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedSlot = Slots.m3;
                              setColorChange();
                              sc2 = true;
                            },
                          );
                        },
                        cardChild: Center(
                          child: null,
                        ),
                        colour: Color(0xFFF1F2F3),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  margin: EdgeInsets.only(
                      top: 2.0, bottom: 22, left: 22.0, right: 24.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Color(0xFF265ED7),
                    onPressed: () {
                      day = formatter.format(_selectedDay);
                      appointment_book();

                      print(formatter.format(_selectedDay));

                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Payment();
                        }));
                      });
                    },
                    child: Text(
                      'Confirm Appointment',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Kumbh Sans',
                          fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget TabelCalender() {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 10, 16),
      lastDay: DateTime.utc(2030, 10, 16),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      calendarStyle: CalendarStyle(
        weekendTextStyle:
            TextStyle(color: Colors.red, fontFamily: 'Kumbh Sans'),
        todayDecoration: BoxDecoration(
          color: Color(0xFF265ED7),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Color(0xFF265ED7),
          shape: BoxShape.circle,
        ),
      ),
      weekendDays: [DateTime.saturday, DateTime.sunday],
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.

        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        // if (_calendarFormat != format) {
        //   // Call `setState()` when updating calendar format
        //   setState(() {
        //     _calendarFormat = format;
        //   });
        // }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
    );
  }
}

// changeColor() {
//   setState(() {
//     col = false;
//   });
// }
