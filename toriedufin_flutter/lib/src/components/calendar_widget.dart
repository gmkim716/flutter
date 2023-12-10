import 'package:flutter/material.dart';
import 'package:toriedufin_flutter/src/controller/user_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime focusDay = DateTime.now();
  DateTime selectDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: focusDay,
      firstDay: DateTime(DateTime.now().year),
      lastDay: DateTime(DateTime.now().year + 2, 1, 0),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          selectDay = selectedDay;
          focusDay = focusedDay;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(selectDay, day);
      },
      onPageChanged: (d) {
        UserController.to.changeMonthAttendance(d.month);
        UserController.to.changeMonth(d.month);
      },
      eventLoader: UserController.to.getEventForDay,
      calendarStyle: const CalendarStyle(
        markerSize: 10.0,
        markerDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
    );
  }
}
