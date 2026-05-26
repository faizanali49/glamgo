class ExploreSalonModel {
  final String id;
  final String name;
  final double rating;
  final int reviewsCount;
  final double distanceKm;
  final String landmarkName;
  final double startingPrice;
  final String thumbnailImg;
  final List<String> tags;
  final bool isTrending;
  final bool hasHomeService;

  ExploreSalonModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviewsCount,
    required this.distanceKm,
    required this.landmarkName,
    required this.startingPrice,
    required this.thumbnailImg,
    required this.tags,
    this.isTrending = false,
    this.hasHomeService = false,
  });
}