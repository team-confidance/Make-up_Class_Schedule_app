import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    "Change Password",
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
                      hintText: "Current password",
                    ),
                    maxLength: 32,
                    style: TextStyle(fontSize: 24),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: InputBorder.none,
                      hintText: "New password",
                    ),
                    maxLength: 32,
                    style: TextStyle(fontSize: 24),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: InputBorder.none,
                      hintText: "Confirm password",
                    ),
                    maxLength: 32,
                    style: TextStyle(fontSize: 24),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "The password is changed",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.blueAccent,
                      textColor: Colors.white,
                      fontSize: 16.0);
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
