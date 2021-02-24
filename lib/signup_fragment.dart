import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupFragment extends StatefulWidget {
  @override
  _SignupFragmentState createState() => _SignupFragmentState();
}

class _SignupFragmentState extends State<SignupFragment> {
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
                    hintText: "First name",
                  ),
                  maxLength: 20,
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
                    hintText: "Last name",
                  ),
                  maxLength: 20,
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
                    hintText: "Email Address",
                  ),
                  maxLength: 50,
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
                    hintText: "Phone Number",
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
                    hintText: "Password",
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
                    msg: "Complete...",
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
              child: Text("Create Account"),
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
            ),
          ],
        )
    );
  }
}
