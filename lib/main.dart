import 'package:flutter/material.dart';
import 'package:flutter_app/routine_screen.dart';
import 'package:flutter_app/settings_screen.dart';

import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex=0;
  String s="Home";
  var titles=["Home","Routine","Settings"];
  final tabs= [
    HomeScreen(),
    RoutineScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(s),
              centerTitle: true,
              actions: <Widget>[
                IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                IconButton(icon: Icon(Icons.logout), onPressed: () {})
              ],
            ),
            body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.blue),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Routine", backgroundColor: Colors.red),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Settings", backgroundColor: Colors.orange),
            ],
            onTap: (index){
              setState(() {
                _currentIndex=index;
                s=titles[_currentIndex];
              });
            },
          ),
        ),
      ),
    );
  }
}
