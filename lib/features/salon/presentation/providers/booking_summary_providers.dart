import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/booking_summary_models.dart';

// Provides localized state mock data derived from previous selection screens
final bookingSummaryDataProvider = Provider.autoDispose<BookingSummaryModel>((ref) {
  return BookingSummaryModel(
    service: SummaryServiceModel(
      name: 'Haircut',
      durationMinutes: 30,
      price: 420.0,
      imageUrl: 'https://images.unsplash.com/photo-1560066984-138dadb4c035?q=80&w=200',
    ),
    salon: SummarySalonModel(
      name: 'The Velvet Touch Spa',
      rating: 4.7,
      address: 'MG Road, Bangalore',
    ),
    appointmentDate: DateTime.now().add(const Duration(days: 1)), // e.g., 12th Mon
    appointmentTimeDisplay: '11:00 AM',
    specialistName: 'Ayesha',
    customerName: 'Priya S.',
    customerPhone: '+91 98765 43210',
    totalPayable: 420.0,
  );
});

// Track Payment Selection State
final paymentMethodProvider = StateProvider.autoDispose<String>((ref) => 'Cash on Delivery');