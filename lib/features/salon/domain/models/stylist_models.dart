enum StylistAvailability { online, away, offline }

class StylistModel {
  final String id;
  final String name;
  final double rating;
  final int yearsExperience;
  final String specialization;
  final List<String> tags;
  final String imageUrl;
  final StylistAvailability availability;

  StylistModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.yearsExperience,
    required this.specialization,
    required this.tags,
    required this.imageUrl,
    required this.availability,
  });
}