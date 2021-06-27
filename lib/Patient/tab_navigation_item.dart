import 'package:flutter/widgets.dart';
import 'package:hospital_management_app/Admin/doctor_details.dart';

import 'homescreen.dart';
import 'package:flutter/material.dart';

import '../MenuBar.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: DoctorDetails(),
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        TabNavigationItem(
          page: DoctorDetails(),
          icon: Icon(Icons.add),
          title: Text("Doctors"),
        ),
        TabNavigationItem(
          page: HomeScreen(),
          icon: Icon(Icons.menu),
          title: Text("Menu"),
        ),
      ];
}
