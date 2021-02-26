import 'package:flutter/material.dart';
import 'package:flutter_app/model/schedule_item.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'available_screen.dart';
import 'model/item_tile.dart';

class RoutineScreen extends StatelessWidget {
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
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 200,
            child: SfCalendar(
              view: CalendarView.month,
            ),
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
