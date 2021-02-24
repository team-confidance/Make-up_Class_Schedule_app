import 'package:flutter/material.dart';
import 'package:flutter_app/model/schedule_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: _width,
            margin: EdgeInsets.only(top: 20),
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
              IconButton(icon: Icon(Icons.add), onPressed: () {}),
            ],
          ),
          Container(
            height: 400,
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
