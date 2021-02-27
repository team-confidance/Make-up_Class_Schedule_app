import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/schedule_item.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'available_screen.dart';
import 'model/item_tile.dart';

class RoutineScreen extends StatefulWidget {
  @override
  _RoutineScreenState createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
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
          /*child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (DateTime newdate) {
              print(newdate);
            },
            use24hFormat: true,
            maximumDate: new DateTime(2018, 12, 30),
            minimumYear: 2010,
            maximumYear: 2018,
            minuteInterval: 1,
            mode: CupertinoDatePickerMode.dateAndTime,
          ),*/
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 200,
            child: SfCalendar(view: CalendarView.month,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("18 February", style: TextStyle(fontSize: 26)),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AvailableScreen()));
                  }),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dummyData.length,
              itemBuilder: (context, i) => Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ItemTile(dummyData[i]),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
