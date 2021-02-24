import 'package:flutter/material.dart';
import 'package:flutter_app/notification_screen.dart';
import 'package:flutter_app/routine_screen.dart';
import 'package:flutter_app/settings_screen.dart';

import 'home_screen.dart';
import 'login_screen.dart';

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
      home: Builder(
        builder: (context) => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(s),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      print("Clicked on Notification");
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                    }),
                IconButton(icon: Icon(Icons.logout), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen()));
                })
              ],
            ),
            body: tabs[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.shifting,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.badge),
                    label: "Home",
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: Icon(Icons.ballot),
                    label: "Routine",
                    backgroundColor: Colors.red),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Settings",
                    backgroundColor: Colors.orange),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                  s = titles[_currentIndex];
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
