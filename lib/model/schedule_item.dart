class ScheduleItem {
  var courseId = "CSE-2311";
  var startTime = ":09:00AM";
  var endTime = "12:00PM";
  var status = "CSE-2311";
  var roomNo = 123;

  ScheduleItem(
      {this.courseId, this.startTime, this.endTime, this.status, this.roomNo});
}

List<ScheduleItem> dummyData=[
  ScheduleItem(courseId: "CSE-2211",startTime: "10:30AM",endTime: "12:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "EEE-1233",startTime: "11:30AM",endTime: "01:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "PHY-2211",startTime: "12:30PM",endTime: "02:00PM",status:"Running", roomNo: 309),
  ScheduleItem(courseId: "BBA-1111",startTime: "01:30PM",endTime: "03:00PM",status:"Canceled", roomNo: 309),
  ScheduleItem(courseId: "CSE-2211",startTime: "02:30PM",endTime: "04:00PM",status:"Left", roomNo: 309),
  ScheduleItem(courseId: "BAN-1111",startTime: "04:30PM",endTime: "05:30PM",status:"Left", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
  ScheduleItem(courseId: "ENG-2211",startTime: "03:30PM",endTime: "05:00PM",status:"Upcoming", roomNo: 309),
];