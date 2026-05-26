import 'package:flutter/material.dart';

import '../../domain/models/booking_slot_models.dart';
import '../../domain/repositories/booking_slot_repository.dart';

class MockBookingSlotRepository implements BookingSlotRepository {
  @override
  Future<List<CalendarDayModel>> getUpcomingCalendarDays() async {
    await Future.delayed(const Duration(milliseconds: 200));
    final List<CalendarDayModel> days = [];
    final now = DateTime.now();
    final weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    for (int i = 0; i < 7; i++) {
      final targetDate = now.add(Duration(days: i));
      days.add(
        CalendarDayModel(
          date: targetDate,
          weekdayName: weekDays[targetDate.weekday % 7],
          dayNumber: targetDate.day.toString().padLeft(2, '0'),
        ),
      );
    }
    return days;
  }

  @override
  Future<List<TimeSlotModel>> getTimeSlotsForDay(DateTime date) async {
    await Future.delayed(const Duration(milliseconds: 250));
    return [
      // Morning Slots
      TimeSlotModel(
        id: 'm1',
        time: const TimeOfDay(hour: 9, minute: 0),
        displayString: '09:00 AM',
      ),
      TimeSlotModel(
        id: 'm2',
        time: const TimeOfDay(hour: 10, minute: 0),
        displayString: '10:00 AM',
      ),
      TimeSlotModel(
        id: 'm3',
        time: const TimeOfDay(hour: 11, minute: 30),
        displayString: '11:30 AM',
      ),
      // Afternoon Slots
      TimeSlotModel(
        id: 'a1',
        time: const TimeOfDay(hour: 12, minute: 0),
        displayString: '12:00 PM',
        isBooked: true,
      ),
      TimeSlotModel(
        id: 'a2',
        time: const TimeOfDay(hour: 14, minute: 30),
        displayString: '02:30 PM',
      ),
      TimeSlotModel(
        id: 'a3',
        time: const TimeOfDay(hour: 16, minute: 0),
        displayString: '04:00 PM',
      ),
      TimeSlotModel(
        id: 'a4',
        time: const TimeOfDay(hour: 17, minute: 30),
        displayString: '05:30 PM',
      ),
      // Evening Slots
      TimeSlotModel(
        id: 'e1',
        time: const TimeOfDay(hour: 19, minute: 0),
        displayString: '07:00 PM',
      ),
      TimeSlotModel(
        id: 'e2',
        time: const TimeOfDay(hour: 20, minute: 30),
        displayString: '08:30 PM',
      ),
    ];
  }
}
