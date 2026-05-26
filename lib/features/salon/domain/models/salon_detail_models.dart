class ServiceModel {
  final String id;
  final String name;
  final int durationMinutes;
  final String specializationType;
  final double price;

  ServiceModel({
    required this.id,
    required this.name,
    required this.durationMinutes,
    required this.specializationType,
    required this.price,
  });
}

class ExpertModel {
  final String id;
  final String name;
  final double rating;
  final String imageUrl;

  ExpertModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.imageUrl,
  });
}

class ReviewSummaryModel {
  final String reviewerName;
  final String relativeTime;
  final String comment;

  ReviewSummaryModel({
    required this.reviewerName,
    required this.relativeTime,
    required this.comment,
  });
}

class SalonDetailModel {
  final String id;
  final String name;
  final double rating;
  final int reviewsCount;
  final String address;
  final String description;
  final String bannerImageUrl;
  final List<ServiceModel> services;
  final List<ExpertModel> experts;
  final List<ReviewSummaryModel> topReviews;

  SalonDetailModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviewsCount,
    required this.address,
    required this.description,
    required this.bannerImageUrl,
    required this.services,
    required this.experts,
    required this.topReviews,
  });
}