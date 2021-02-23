class ScheduleItem {
  var courseId = "CSE-2311";
  var timeFrom = "90:00am";
  var durationMin = 90;
  var status = "CSE-2311";
  var roomNo = 123;

  ScheduleItem(
      {this.courseId, this.timeFrom, this.durationMin, this.status, this.roomNo});
}

List<ScheduleItem> dummyData=[
  ScheduleItem(courseId: "CSE-2211",timeFrom: "10:30am",durationMin: 90,status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "EEE-1233",timeFrom: "11:30am",durationMin: 90,status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "PHY-2211",timeFrom: "12:30am",durationMin: 90,status:"Running", roomNo: 309),
  ScheduleItem(courseId: "BBA-1111",timeFrom: "01:30am",durationMin: 90,status:"Cancel", roomNo: 309),
  ScheduleItem(courseId: "CSE-2211",timeFrom: "02:30am",durationMin: 90,status:"Left", roomNo: 309),
  ScheduleItem(courseId: "BAN-1111",timeFrom: "04:30am",durationMin: 90,status:"Left", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",timeFrom: "03:30am",durationMin: 90,status:"Upcoming", roomNo: 309),
];