import 'package:flutter/material.dart';
import 'package:flutter_app/available_screen.dart';
import 'package:flutter_app/model/item_tile.dart';
import 'package:flutter_app/model/schedule_item.dart';

class HomeScreen extends StatelessWidget {
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
                child: ListView.builder(
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
