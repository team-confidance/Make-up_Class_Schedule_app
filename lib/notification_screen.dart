import 'package:flutter/material.dart';
import 'package:flutter_app/model/schedule_item.dart';

import 'login_screen.dart';

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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
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
