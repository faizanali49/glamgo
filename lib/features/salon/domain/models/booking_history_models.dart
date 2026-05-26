enum HistoryStatus { upcoming, completed, cancelled }

class BookingHistoryModel {
  final String id;
  final String salonName;
  final String serviceName;
  final String specialistName;
  final String imageUrl;
  final DateTime appointmentDateTime;
  final String timeDisplayString;
  final double price;
  final HistoryStatus status;

  BookingHistoryModel({
    required this.id,
    required this.salonName,
    required this.serviceName,
    required this.specialistName,
    required this.imageUrl,
    required this.appointmentDateTime,
    required this.timeDisplayString,
    required this.price,
    required this.status,
  });
}