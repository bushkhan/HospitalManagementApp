import 'package:flutter/widgets.dart';
import 'tab_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedItem;
  int _currentIndex = 0;
  double _registerYoffset = 0;
  double _loginYOffset = 0;
  double _loginXoffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch (_currentIndex) {
      case 0:
        _loginYOffset = windowHeight;
        _registerYoffset = windowHeight;
        _loginXoffset = 0;

        break;
      case 3:
        _loginYOffset = 270;
        _registerYoffset = windowHeight;
        _loginXoffset = 0;

        break;
    }
    return Scaffold(
      body: Stack(
        children: [
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.easeIn,
        showElevation: true,
        selectedIndex: _currentIndex,
        onItemSelected: (int index) => setState(() => _currentIndex = index),
        items: [
          for (final tabItem in TabNavigationItem.items)
            BottomNavyBarItem(
              icon: tabItem.icon,
              title: tabItem.title,
              inactiveColor: Colors.grey.shade900,
              activeColor: Color(0xFF265ED5),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
