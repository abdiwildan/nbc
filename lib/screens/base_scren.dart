import 'package:flutter/material.dart';
import 'package:nbc/constants/color_constants.dart';
import 'package:nbc/screens/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'aset_screen.dart';

class BaseScreen extends StatefulWidget {

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AsetScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.database), label: "Cards"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.chartBar), label: "Overview"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.cog), label: "Settings"),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
