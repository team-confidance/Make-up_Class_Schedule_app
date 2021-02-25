import 'package:flutter/material.dart';
import 'package:flutter_app/home_screen.dart';
import 'package:flutter_app/login_screen.dart';
import 'package:flutter_app/notification_screen.dart';
import 'package:flutter_app/routine_screen.dart';
import 'package:flutter_app/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex=0;
  String s="Home";
  var titles=["Home","Routine","Settings"];
  final tabs= [
    HomeScreen(),
    RoutineScreen(),
    SettingsScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                FirebaseAuth.instance.signOut();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginScreen()));
              })
            ],
          ),
          body: PageStorage(
            child: tabs[_currentIndex],
            bucket: bucket,
          ),

          /*body: tabs[_currentIndex],*/

          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.ballot,
              color: _currentIndex == 1 ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _currentIndex = 1;
                s = titles[_currentIndex];
              });
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 5,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            _currentIndex = 0;
                            s = titles[_currentIndex];
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.badge,
                              color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Right Tab bar icons

                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            _currentIndex = 2;
                            s = titles[_currentIndex];
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: _currentIndex == 2 ? Colors.blue : Colors.grey,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: _currentIndex == 2 ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          ),

          /*bottomNavigationBar: BottomNavigationBar(
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
            ),*/
    );
  }
}
