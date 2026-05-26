enum BookingStatus { confirmed, pending, cancelled }

class BookingReceiptModel {
  final String bookingId;
  final String serviceName;
  final String salonName;
  final String imageUrl;
  final DateTime appointmentDate;
  final String appointmentTimeDisplay;
  final String staffName;
  final double totalPaid;
  final BookingStatus status;
  final String paymentMethodDisplay;

  BookingReceiptModel({
    required this.bookingId,
    required this.serviceName,
    required this.salonName,
    required this.imageUrl,
    required this.appointmentDate,
    required this.appointmentTimeDisplay,
    required this.staffName,
    required this.totalPaid,
    required this.status,
    required this.paymentMethodDisplay,
  });
}