//ignore: avoid_web_libraries_in_flutter
// import "dart:html";

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/available_screen.dart';
import 'package:flutter_app/model/item_tile.dart';
import 'package:flutter_app/model/schedule_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final database = FirebaseDatabase.instance.reference().child("TodayClass");
  List<ScheduleItem> dummyData = [];

  @override
  void initState() {
    super.initState();
    database.once().then((DataSnapshot snapshot){
      var data = snapshot.value;
      var values = snapshot.value;
      // var keys = snapshot.value.keys;
      dummyData.clear();
      print("DATA...... = .....$data");
      print("VALUES...... = .....$values");
      /*print("KEYS...... = .....$keys");
      print("VALUES...... = .....$values");*/

      for(var value in values){
        print("value = $value");
        print("value = ${value["courseId"]}");
        print("value type = ${value.runtimeType}");
        print("value[courseId] type = ${value["courseId"].runtimeType}");
        // print("value = ${value.courseId}");

        /*Map itemMap = jsonDecode(value);
        print("itemMap = $itemMap");
        var item = ScheduleItem.fromJson(itemMap);*/
        // var item = ScheduleItem.fromJson(value);
        // print("ITEM BEFORE = $item");


        var item = ScheduleItem();
        item.courseId = value["courseId"] == null ? "" : value["courseId"];
        item.endTime = value["endTime"] == null ? "" : value["endTime"];
        item.roomNo = value["roomNo"] == null ? "" : value["roomNo"];
        item.startTime = value["startTime"] == null ? "" : value["startTime"];
        item.status = value["status"] == null ? "" : value["status"];



        /*item.courseId = value.courseId == null ? "" : value.courseId;
        item.endTime = value.endTime == null ? "" : value.endTime;
        item.roomNo = value.roomNo == null ? "" : value.roomNo;
        item.startTime = value.startTime == null ? "" : value.startTime;
        item.status = value.status == null ? "" : value.status;*/
        print("ITEM = $item");
        dummyData.add(item);
      }
      /*try{
      data.forEach((key, value){
        // if(value != null && key != null){

        print("ss5...............................................");
        print("ss5...............................................");
        ScheduleItem item = ScheduleItem(
          courseId: value['courseId'],
          startTime: value['startTime'],
          endTime: value['endTime'],
          status: value['status'],
          roomNo: value['roomNo'],
        );

        dummyData.add(item);
        }
      // }
      );
      }
      catch(e){
        print("EXCEPTION ===  $e");
      }*/
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: _height,
          decoration: BoxDecoration(color: Color(0xFFE4ECF1)),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
              ),
                child: Container(
                  child: Text("Important Notifications"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Today's", style: TextStyle(fontSize: 26)),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AvailableScreen()));
                      }),
                ],
              ),
              Expanded(
                //height: 500,
                child: dummyData.length ==0 ? Text("NO ITEM") : ListView.builder(
                  itemCount: dummyData.length,
                  itemBuilder: (context, i) => Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ItemTile(dummyData[i]),
                  ),
                ),
              ),
            ],
          ),
    ));
  }
}
