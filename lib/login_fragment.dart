import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginFragment extends StatefulWidget {
  @override
  _LoginFragmentState createState() => _LoginFragmentState();
}

class _LoginFragmentState extends State<LoginFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
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
        )
    );
  }
}
