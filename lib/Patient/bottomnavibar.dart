import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:hospital_management_app/Admin/admin_profile.dart';
import 'package:hospital_management_app/Admin/doctor_details.dart';
import 'package:hospital_management_app/Patient/homescreen.dart';
import 'package:hospital_management_app/Patient/settings.dart';

class navBar extends StatefulWidget {
  @override
  _navBarState createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DoctorDetails(),
    SettingList(),
    AdminProfile(),
  ];

  int _selectedItemPosition = 0;

  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.pinned;
  SnakeShape snakeShape = SnakeShape.rectangle;
  final padding = EdgeInsets.zero;
  ShapeBorder bottomBarShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6), topRight: Radius.circular(6)));

  bool showSelectedLabels = true;
  bool showUnselectedLabels = true;

  Color selectedColor = Color(0xFF265ED7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: _widgetOptions.elementAt(_selectedItemPosition),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: SnakeNavigationBar.color(
        // height: 80,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.grey.shade800,

        ///configuration for SnakeNavigationBar.gradient
        // snakeViewGradient: selectedGradient,
        // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        // unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Doctors'),
          const BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp), label: 'Profile'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 13),
        unselectedLabelStyle: const TextStyle(fontSize: 13),
      ),
    );
  }
}
