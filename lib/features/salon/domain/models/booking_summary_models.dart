class SummaryServiceModel {
  final String name;
  final int durationMinutes;
  final double price;
  final String imageUrl;

  SummaryServiceModel({
    required this.name,
    required this.durationMinutes,
    required this.price,
    required this.imageUrl,
  });
}

class SummarySalonModel {
  final String name;
  final double rating;
  final String address;

  SummarySalonModel({
    required this.name,
    required this.rating,
    required this.address,
  });
}

class BookingSummaryModel {
  final SummaryServiceModel service;
  final SummarySalonModel salon;
  final DateTime appointmentDate;
  final String appointmentTimeDisplay;
  final String specialistName;
  final String customerName;
  final String customerPhone;
  final double totalPayable;

  BookingSummaryModel({
    required this.service,
    required this.salon,
    required this.appointmentDate,
    required this.appointmentTimeDisplay,
    required this.specialistName,
    required this.customerName,
    required this.customerPhone,
    required this.totalPayable,
  });
}