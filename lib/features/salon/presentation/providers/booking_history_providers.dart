import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/booking_history_models.dart';

// Filter state tracking provider (Defaulting to 'Upcoming')
final activeHistoryTabProvider = StateProvider.autoDispose<HistoryStatus>((ref) => HistoryStatus.upcoming);

// Mock server payload data layer stream provider
final bookingHistoryStreamProvider = StreamProvider.autoDispose<List<BookingHistoryModel>>((ref) {
  return Stream.value([
    BookingHistoryModel(
      id: 'b-001',
      salonName: 'The Velvet Touch Spa',
      serviceName: 'Haircut',
      specialistName: 'Ayesha',
      imageUrl: 'https://images.unsplash.com/photo-1560066984-138dadb4c035?q=80&w=150',
      appointmentDateTime: DateTime.now().add(const Duration(days: 1)),
      timeDisplayString: '12 Mon  •  11:00 AM',
      price: 500.0,
      status: HistoryStatus.upcoming,
    ),
    BookingHistoryModel(
      id: 'b-002',
      salonName: 'Glow & Style Studio',
      serviceName: 'Facial',
      specialistName: 'Premium Service',
      imageUrl: 'https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?q=80&w=150',
      appointmentDateTime: DateTime.now().subtract(const Duration(days: 4)),
      timeDisplayString: '05 Fri  •  02:30 PM',
      price: 1200.0,
      status: HistoryStatus.completed,
    ),
  ]);
});

// Computed state filtering logic block
final filteredBookingsProvider = Provider.autoDispose<List<BookingHistoryModel>>((ref) {
  final currentTab = ref.watch(activeHistoryTabProvider);
  final allBookingsAsync = ref.watch(bookingHistoryStreamProvider);

  return allBookingsAsync.maybeWhen(
    data: (data) => data.where((b) => b.status == currentTab).toList(),
    orElse: () => [],
  );
});