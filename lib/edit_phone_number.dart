import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_screen.dart';

class EditPhoneNumber extends StatefulWidget {
  @override
  _EditPhoneNumberState createState() => _EditPhoneNumberState();
}

class _EditPhoneNumberState extends State<EditPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //title: Text(""),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.logout), onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginScreen()));
            })
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 70,
                width: double.infinity,
                margin:
                    EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 80),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  child: Center(
                      child: Text(
                    "Change Phone",
                    style: TextStyle(color: Color(0xFF707070), fontSize: 24),
                  )),
                ),
              ),
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: InputBorder.none,
                      hintText: "+8801xxxxxxxxx",
                    ),
                    maxLength: 14,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: InputBorder.none,
                      hintText: "New phone no.",
                    ),
                    maxLength: 14,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "The number is changed",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.blueAccent,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                child: Text("Confirm"),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
