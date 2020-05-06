//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_calendar/calendar.dart';
//
//class CalendarEvent extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _CalendarEvent();
//  }
//}
//
//class _CalendarEvent extends State<CalendarEvent>{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        body:
//        SfCalendar(
//          view: CalendarView.month,
//          dataSource: MeetingDataSource(_getDataSource()),
//          monthViewSettings: MonthViewSettings(
//              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
//        )
//    );
//  }
//}
//
//List<Meeting> _getDataSource() {
//  var meetings = <Meeting>[];
//  final DateTime today = DateTime.now();
//  final DateTime startTime =
//  DateTime(today.year, today.month, today.day, 9, 0, 0);
//  final DateTime endTime = startTime.add(const Duration(hours: 2));
//  meetings.add(
//      Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false));
//  return meetings;
//}
//
//class MeetingDataSource extends CalendarDataSource {
//  MeetingDataSource(List<Meeting> source){
//    appointments = source;
//  }
//
//  @override
//  DateTime getStartTime(int index) {
//    return appointments[index].from;
//  }
//
//  @override
//  DateTime getEndTime(int index) {
//    return appointments[index].to;
//  }
//
//  @override
//  String getSubject(int index) {
//    return appointments[index].eventName;
//  }
//
//  @override
//  Color getColor(int index) {
//    return appointments[index].background;
//  }
//
//  @override
//  bool isAllDay(int index) {
//    return appointments[index].isAllDay;
//  }
//}
//
//class Meeting {
//  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
//
//  String eventName;
//  DateTime from;
//  DateTime to;
//  Color background;
//  bool isAllDay;
//}
//
//

import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class CalendarEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarEventState();
  }
}

class _CalendarEventState extends State<CalendarEvent> {
  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  List _selectedEvents;
  DateTime _selectedDay;

  final Map _events = {
    DateTime(2019, 3, 1): [
      {'name': 'Event A', 'isDone': true},
    ],
    DateTime(2019, 3, 4): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2019, 3, 5): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2019, 3, 13): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2019, 3, 15): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2019, 3, 26): [
      {'name': 'Event A', 'isDone': false},
    ],
  };

  @override
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Text('Calendario'),
      // ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: Calendar(
                  events: _events,
                  onRangeSelected: (range) =>
                      print("Range is ${range.from}, ${range.to}"),
                  onDateSelected: (date) => _handleNewDate(date),
                  isExpandable: true,
//                  showTodayIcon: true,
                  eventDoneColor: Colors.green,
                  eventColor: Colors.grey),
            ),
            _buildEventList()
          ],
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.black12),
            ),
          ),
          padding:
          const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: ListTile(
            title: Text(_selectedEvents[index]['name'].toString()),
            onTap: () {},
          ),
        ),
        itemCount: _selectedEvents.length,
      ),
    );
  }
}