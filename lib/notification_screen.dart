import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/item_tile.dart';
import 'package:flutter_app/model/schedule_item.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, "/login_screen", (r) => false);
                })
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: _height,
          decoration: BoxDecoration(color: Color(0xFFE4ECF1)),
          child: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: (context, i) =>
              /*Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ItemTile(dummyData[i]),
                ),*/
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                  child: ItemTile(dummyData[i])
                ),
          ),
        ),
      ),
    );
  }
}
