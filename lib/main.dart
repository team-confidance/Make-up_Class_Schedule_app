import 'package:flutter/material.dart';
import 'package:flutter_app/landing_page.dart';
import 'package:flutter_app/notification_screen.dart';
import 'package:flutter_app/routine_screen.dart';
import 'package:flutter_app/settings_screen.dart';

import 'home_screen.dart';
import 'login_screen.dart';
import 'routine_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => SafeArea(
        child: LandingPage(),
       ),
      ),
    );
  }
}
