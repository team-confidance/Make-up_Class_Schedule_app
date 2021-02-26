import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/schedule_item.dart';

class ItemTile extends StatelessWidget {
  final ScheduleItem dummyData;

  ItemTile(this.dummyData);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dummyData.courseId, style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey,size: 14,),
                  Text(" " + dummyData.startTime + " - " + dummyData.endTime.toString()+"    "),
                  Icon(Icons.stacked_bar_chart, color: Colors.grey,size: 14,),
                  Text(
                    dummyData.status,
                    style: TextStyle(
                        color: statusColorOf(dummyData.status),
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          Column(children: [
            Text(
              "Room No",
              style: TextStyle(fontSize: 8, color: Colors.black),
            ),
            Container(
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0x20FF0070),
                borderRadius: BorderRadius.all(Radius.elliptical(100, 80)),
              ),
              child: Center(
                  child: Text(dummyData.roomNo.toString(),
                      style: TextStyle(
                          color: Color(0xff565756),
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
            )
          ]),
        ],
      ),
    );
  }

  statusColorOf(String status) {
    if (status == "Canceled")
      return Colors.red;
    else if (status == "Upcoming")
      return Colors.orange;
    else if (status == "Running")
      return Colors.greenAccent[400];
    else if (status == "Left") return Colors.grey;
  }
}
