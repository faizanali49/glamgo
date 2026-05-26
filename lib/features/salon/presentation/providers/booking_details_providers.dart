import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/booking_details_models.dart';

// Provides precise historical/real-time state details based on selected booking item
final detailedBookingProvider = Provider.autoDispose<DetailedBookingModel>((ref) {
  return DetailedBookingModel(
    bookingId: '#GLM-20491',
    serviceName: 'Haircut',
    salonName: 'The Velvet Touch Spa',
    appointmentDate: DateTime.now(), // 12 Mon
    appointmentTimeDisplay: '11:00 AM',
    durationMinutes: 30,
    staffName: 'Ayesha',
    staffRating: 4.9,
    staffImageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=150',
    locationAddress: 'No. 45, 1st Floor, Pride Elite, MG Road, near Trinity Metro, Bengaluru, Karnataka 560001',
    distanceFromUser: '1.3 km away from you',
    paymentMethod: 'Cash',
    paymentStatus: 'PENDING',
    totalAmount: 420.0,
    trackingTimeline: [
      TrackingStepModel(
        title: 'Booking Confirmed',
        subtitle: 'Done on 10 Mon, 04:30 PM',
        status: TrackingStepStatus.completed,
      ),
      TrackingStepModel(
        title: 'Salon Notified',
        subtitle: 'Acknowledged by salon',
        status: TrackingStepStatus.completed,
      ),
      TrackingStepModel(
        title: 'Appointment Scheduled',
        subtitle: 'Your stylist is preparing',
        status: TrackingStepStatus.active,
      ),
      TrackingStepModel(
        title: 'Service Completed',
        subtitle: 'Pending arrival',
        status: TrackingStepStatus.inactive,
      ),
    ],
  );
});