import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/booking_receipt_models.dart';

// Inject finalized immutable order state post-payment hook resolution
final bookingReceiptProvider = Provider.autoDispose<BookingReceiptModel>((ref) {
  return BookingReceiptModel(
    bookingId: '#GLM-20491',
    serviceName: 'Haircut',
    salonName: 'The Velvet Touch Spa',
    imageUrl: 'https://images.unsplash.com/photo-1560066984-138dadb4c035?q=80&w=200',
    appointmentDate: DateTime.now().add(const Duration(days: 1)), // e.g., 12 Mon
    appointmentTimeDisplay: '11:00 AM',
    staffName: 'Ayesha',
    totalPaid: 420.0,
    status: BookingStatus.confirmed,
    paymentMethodDisplay: 'Cash',
  );
});