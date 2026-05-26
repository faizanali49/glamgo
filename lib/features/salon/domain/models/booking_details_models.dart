enum TrackingStepStatus { completed, active, inactive }

class TrackingStepModel {
  final String title;
  final String subtitle;
  final TrackingStepStatus status;

  TrackingStepModel({
    required this.title,
    required this.subtitle,
    required this.status,
  });
}

class DetailedBookingModel {
  final String bookingId;
  final String serviceName;
  final String salonName;
  final DateTime appointmentDate;
  final String appointmentTimeDisplay;
  final int durationMinutes;
  final String staffName;
  final double staffRating;
  final String staffImageUrl;
  final String locationAddress;
  final String distanceFromUser;
  final String paymentMethod;
  final String paymentStatus;
  final double totalAmount;
  final List<TrackingStepModel> trackingTimeline;

  DetailedBookingModel({
    required this.bookingId,
    required this.serviceName,
    required this.salonName,
    required this.appointmentDate,
    required this.appointmentTimeDisplay,
    required this.durationMinutes,
    required this.staffName,
    required this.staffRating,
    required this.staffImageUrl,
    required this.locationAddress,
    required this.distanceFromUser,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.totalAmount,
    required this.trackingTimeline,
  });
}