import 'package:flutter/material.dart';

class CalendarDayModel {
  final DateTime date;
  final String weekdayName;
  final String dayNumber;
  final bool hasAvailableSlots;

  CalendarDayModel({
    required this.date,
    required this.weekdayName,
    required this.dayNumber,
    this.hasAvailableSlots = true,
  });
}

class TimeSlotModel {
  final String id;
  final TimeOfDay time;
  final String displayString;
  final bool isBooked;

  TimeSlotModel({
    required this.id,
    required this.time,
    required this.displayString,
    this.isBooked = false,
  });
}