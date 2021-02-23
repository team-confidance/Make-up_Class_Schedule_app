import 'package:flutter/material.dart';
import 'package:flutter_app/model/schedule_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: _width,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text("Important Notifications"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Today's",style: TextStyle(fontSize: 26)),
              IconButton(icon: Icon(Icons.add), onPressed: () {
              }),
            ],
          ),
          ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: (context,i)=> Column(
              children: <Widget>[
                ListTile(
                  title: Text(dummyData[i].courseId),
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.lock_clock),
                      Text(dummyData[i].timeFrom+"-"+dummyData[i].durationMin.toString()),
                      Icon(Icons.network_cell),
                      Text(dummyData[i].status)
                    ],
                  ),
                  leading: CircleAvatar(
                    child: Text(dummyData[i].roomNo.toString()),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
