import 'package:flutter/material.dart';
import 'package:flutter_app/model/item_tile.dart';
import 'package:flutter_app/model/schedule_item.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_screen.dart';

class AvailableScreen extends StatefulWidget {
  @override
  _AvailableScreenState createState() => _AvailableScreenState();
}

class _AvailableScreenState extends State<AvailableScreen> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Available Rooms"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AuthScreen()));
                })
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Color(0xFFE4ECF1)),
          height: _height,
          width: _width,
          child: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: (context, i) => Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ItemTile(dummyData[i]),
            ),
          ),
        ),
      ),
    );
  }
}
