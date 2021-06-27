import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//import '../utils.dart';

class AppCalendar extends StatefulWidget {
  @override
  _AppCalendarState createState() => _AppCalendarState();
}

class _AppCalendarState extends State<AppCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 10, 16),
      lastDay: DateTime.utc(2030, 10, 16),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      calendarStyle: CalendarStyle(
        weekendTextStyle:
            TextStyle(color: Colors.red, fontFamily: 'Kumbh Sans'),
        todayDecoration: BoxDecoration(
          color: Color(0xFF265ED7),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Color(0xFF265ED7),
          shape: BoxShape.circle,
        ),
      ),
      weekendDays: [DateTime.saturday, DateTime.sunday],
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.

        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        // if (_calendarFormat != format) {
        //   // Call `setState()` when updating calendar format
        //   setState(() {
        //     _calendarFormat = format;
        //   });
        // }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
    );
  }
}
