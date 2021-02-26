import 'package:flutter/material.dart';
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
          title: Text("Notifications"),
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
          height: _height,
          width: _width,
          child: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: (context, i) => Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: ListTile(
                      tileColor: Colors.grey,
                      title: Text(dummyData[i].courseId),
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.lock_clock),
                          Text(dummyData[i].timeFrom +
                              "-" +
                              dummyData[i].durationMin.toString()),
                          Icon(Icons.network_cell),
                          Text(dummyData[i].status)
                        ],
                      ),
                      leading: CircleAvatar(
                        child: Text(dummyData[i].roomNo.toString()),
                      ),
                      onTap: () {
                        print("Clicked$i");
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
