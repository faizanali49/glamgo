class CategoryModel {
  final String id;
  final String name;

  CategoryModel({required this.id, required this.name});
}

class OfferBannerModel {
  final String id;
  final String title;
  final String description;
  final double discountPercentage;
  final String imageUrl;

  OfferBannerModel({
    required this.id,
    required this.title,
    required this.description,
    required this.discountPercentage,
    required this.imageUrl,
  });
}

class SalonSummaryModel {
  final String id;
  final String name;
  final double rating;
  final double distanceKm;
  final String locationName;
  final double startingPrice;
  final String imageUrl;

  SalonSummaryModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.distanceKm,
    required this.locationName,
    required this.startingPrice,
    required this.imageUrl,
  });
}