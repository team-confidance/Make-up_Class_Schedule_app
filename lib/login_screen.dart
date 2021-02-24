import 'package:flutter/material.dart';
import 'package:flutter_app/login_fragment.dart';
import 'package:flutter_app/signup_fragment.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var cornarR = 50.0;
  var btnSignUpColor = Color(0xFFFFFFFF);
  var btnLoginColor = Color(0xFFE4ECF1);

  final tabs=[LoginFragment(), SignupFragment()];
  var pos=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Clicked Login");
                      setState(() {
                        btnSignUpColor = Color(0xFFFFFFFF);
                        btnLoginColor = Color(0xFFE4ECF1);
                        pos=0;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 130,
                      decoration: BoxDecoration(
                          color: btnLoginColor,
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cornarR),
                              bottomLeft: Radius.circular(cornarR))),
                      child: Container(
                        child: Center(
                            child: Text(
                          "Login",
                          style:
                              TextStyle(color: Color(0xFF707070), fontSize: 24),
                        )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Clicked Signup");
                      setState(() {
                        btnSignUpColor = Color(0xFFE4ECF1);
                        btnLoginColor = Color(0xFFFFFFFF);
                        pos=1;
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 130,
                      decoration: BoxDecoration(
                          color: btnSignUpColor,
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(cornarR),
                              bottomRight: Radius.circular(cornarR))),
                      child: Container(
                        child: Center(
                            child: Text(
                          "Sign Up",
                          style:
                              TextStyle(color: Color(0xFF707070), fontSize: 24),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                  child: tabs[pos]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
