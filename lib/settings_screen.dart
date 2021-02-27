import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/edit_password.dart';

import 'edit_phone_number.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFE4ECF1)),
        //width: MediaQuery.of(context).size.width,
        width: double.infinity,
        // decoration: BoxDecoration(color: Color(0xFFA0D0FF)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 20),
              child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/arif_ahmed.jpg')),
            ),
            Container(
              child: Text(
                "Arif Ahmed",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(child: Text("Associate Professor")),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "E-mail: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "arifahmed@lus.ac.bd",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Phone: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "+8801xxxxxxx",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          print("Edit Button Clicked");
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => EditPhoneNumber()));
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => EditPassword()));
              },
              /*shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),*/
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Text("Change password"),
            ),
          ],
        ),
      ),
    );
  }
}
