

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login_screen.dart';
import 'package:flutter_app/main_screen.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // print("${snapshot.hasError}...........................");
          // print("${snapshot.error}...........................");
          return Scaffold(
            body: Center(
              child: Text(
                "Error: ${snapshot.error}.",
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          //StreamBuilder can check the login state live
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot){
              if(streamSnapshot.hasError){
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${streamSnapshot.error}"),
                  ),
                );
              }
              if(streamSnapshot.connectionState == ConnectionState.active){
                User _user = streamSnapshot.data;
                if(_user == null){
                  return LoginScreen();
                }
                else{
                  return MainScreen();
                }
              }
              return Scaffold(
                body: Center(
                  child: Text("checking authentication...",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
        }

        return Scaffold(
          body: Center(
            child: Text("Firebase is initializing....",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        );
      },
    );
  }
}
