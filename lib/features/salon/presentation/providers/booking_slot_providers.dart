import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hbazar/features/salon/domain/repositories/booking_slot_repository.dart';
import '../../data/repositories/mock_booking_slot_repository.dart';
import '../../domain/models/booking_slot_models.dart';

final bookingRepositoryProvider = Provider<BookingSlotRepository>((ref) {
  return MockBookingSlotRepository();
});

final calendarDaysStreamProvider = FutureProvider.autoDispose<List<CalendarDayModel>>((ref) async {
  return ref.watch(bookingRepositoryProvider).getUpcomingCalendarDays();
});

// Track selections natively
final selectedDateProvider = StateProvider.autoDispose<DateTime>((ref) => DateTime.now());

final timeSlotsStreamProvider = FutureProvider.family.autoDispose<List<TimeSlotModel>, DateTime>((ref, date) async {
  return ref.watch(bookingRepositoryProvider).getTimeSlotsForDay(date);
});

final selectedTimeSlotProvider = StateProvider.autoDispose<TimeSlotModel?>((ref) => null);