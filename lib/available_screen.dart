import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/available_item.dart';
import 'package:flutter_app/model/available_item_tile.dart';
import 'package:intl/intl.dart';

class AvailableScreen extends StatefulWidget {
  @override
  _AvailableScreenState createState() => _AvailableScreenState();
}

class _AvailableScreenState extends State<AvailableScreen> {
  final availableRoomDb = FirebaseDatabase.instance.reference().child("AvailableRooms");
  final bookedRoomsDb = FirebaseDatabase.instance.reference().child("BookedRooms");
  List<AvailableItem> dummyData = [];

  @override
  void initState() {
    super.initState();

    DateTime date = DateTime.now();
    var today = DateFormat('EEEE').format(date);

    availableRoomDb.child(today).once().then((DataSnapshot snapshot){
      var values = snapshot.value;
      print("AVAILABLE values = ${values}");
      dummyData.clear();

      for(var value in values){
        var item = AvailableItem();
        item.endTime = value["endTime"] == null ? "" : value["endTime"];
        item.roomNo = value["roomNo"] == null ? "" : value["roomNo"];
        item.startTime = value["startTime"] == null ? "" : value["startTime"];

        dummyData.add(item);
      }
      print(".............................FINISHED LOOOP!!!");
      setState(() {
      });
    });

    today = "${date.day}-${date.month}-${date.year}";
    bookedRoomsDb.child(today).once().then((DataSnapshot snapshot){
      var values = snapshot.value;
      print("BOOKED values = $values");

      for(var value in values){
        var item = AvailableItem();
        item.endTime = value["endTime"] == null ? "" : value["endTime"];
        item.roomNo = value["roomNo"] == null ? "" : value["roomNo"];
        item.startTime = value["startTime"] == null ? "" : value["startTime"];

        dummyData.remove(item);
      }
      print(".............................FINISHED LOOOP!!!");
      setState(() {
      });
    });
  }

  DateTime selectedDate = DateTime.now();
  var days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  var dayName = "";

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dayName = days[selectedDate.weekday];
        _resetData(dayName, selectedDate);
      });
  }

  void _resetData(String today, DateTime selectedDate) {
    dummyData.clear();

    availableRoomDb.child(today).once().then((DataSnapshot snapshot){
      var values = snapshot.value;
      dummyData.clear();

      for(var value in values){
        var item = AvailableItem();
        item.endTime = value["endTime"] == null ? "" : value["endTime"];
        item.roomNo = value["roomNo"] == null ? "" : value["roomNo"];
        item.startTime = value["startTime"] == null ? "" : value["startTime"];

        dummyData.add(item);
      }
      print(".............................FINISHED LOOOP!!!");
      setState(() {
      });
    });

    today = "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
    bookedRoomsDb.child(today).once().then((DataSnapshot snapshot){
      var values = snapshot.value;

      for(var value in values){
        var item = AvailableItem();
        item.endTime = value["endTime"] == null ? "" : value["endTime"];
        item.roomNo = value["roomNo"] == null ? "" : value["roomNo"];
        item.startTime = value["startTime"] == null ? "" : value["startTime"];

        dummyData.remove(item);
      }
      print(".............................FINISHED LOOOP!!!");
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Available Rooms"),
          centerTitle: true,
        ),
        body: Container(
          height: _height,
          decoration: BoxDecoration(color: Color(0xFFE4ECF1)),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    width: _width,
                    child: Center(
                      child: Text(
                        "${days[selectedDate.weekday]} ${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      /*image: DecorationImage(fit: BoxFit.cover,
                    image: AssetImage("assets/images/text_bg.png",),
                  ),*/
                    ),
                  ),
                ),
                //child: SfCalendar(view: CalendarView.month,),
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Routine", style: TextStyle(fontSize: 26)),
                  *//*GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AvailableScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.add),
                    ),
                  ),*//*
                ],
              ),*/
              Expanded(
                child: ListView.builder(
                  itemCount: dummyData.length,
                  itemBuilder: (context, i) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: AvailableItemTile(dummyData[i]),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
