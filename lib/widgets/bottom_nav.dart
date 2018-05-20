import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 32.0,
      currentIndex: _currentIndex,
      onTap: (int index) {
        switch (index) {
          case 0:
            print(0);
            return;
          case 1:
            print(1);
            return;
          case 2:
            print(2);
            return;
        }
        setState(() {
          _currentIndex = index;
        });
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text('Profile')),
      ],
    );
  }
}
