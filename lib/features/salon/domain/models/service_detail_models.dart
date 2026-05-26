class ServiceDetailModel {
  final String id;
  final String name;
  final double startingPrice;
  final int baseDurationMinutes;
  final String description;
  final List<String> whatsIncluded;
  final bool isPopular;
  final String imageUrl;

  ServiceDetailModel({
    required this.id,
    required this.name,
    required this.startingPrice,
    required this.baseDurationMinutes,
    required this.description,
    required this.whatsIncluded,
    this.isPopular = false,
    required this.imageUrl,
  });
}

class ServiceExpertModel {
  final String id;
  final String name;
  final double rating;
  final String imageUrl;

  ServiceExpertModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.imageUrl,
  });
}