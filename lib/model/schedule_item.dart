class ScheduleItem {
  var courseId = "CSE-2311";
  var timeFrom = ":09:00AM";
  var durationMin = "12:00PM";
  var status = "CSE-2311";
  var roomNo = 123;

  ScheduleItem(
      {this.courseId, this.timeFrom, this.durationMin, this.status, this.roomNo});
}

List<ScheduleItem> dummyData=[
  ScheduleItem(courseId: "CSE-2211",timeFrom: "10:30AM",durationMin: "12:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "EEE-1233",timeFrom: "11:30AM",durationMin: "01:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "PHY-2211",timeFrom: "12:30PM",durationMin: "02:00PM",status:"Running", roomNo: 309),
  ScheduleItem(courseId: "BBA-1111",timeFrom: "01:30PM",durationMin: "03:00PM",status:"Cancel", roomNo: 309),
  ScheduleItem(courseId: "CSE-2211",timeFrom: "02:30PM",durationMin: "04:00PM",status:"Left", roomNo: 309),
  ScheduleItem(courseId: "BAN-1111",timeFrom: "04:30PM",durationMin: "05:30PM",status:"Left", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",timeFrom: "03:30PM",durationMin: "05:00PM",status:"Upcoming", roomNo: 309),
];