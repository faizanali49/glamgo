import '../models/booking_slot_models.dart';

abstract class BookingSlotRepository {
  Future<List<CalendarDayModel>> getUpcomingCalendarDays();
  Future<List<TimeSlotModel>> getTimeSlotsForDay(DateTime date);
}