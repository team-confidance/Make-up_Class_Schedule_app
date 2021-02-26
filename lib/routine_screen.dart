import 'package:flutter/material.dart';
import 'package:flutter_app/model/schedule_item.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class RoutineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color(0xFFE4ECF1)),
          child: Column(
      children: <Widget>[
          Container(
              child: SfCalendar(
                view: CalendarView.month,
              ),
            ),
          Container(
            height: 350,
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
      ],
    ),
        ));
  }
}
