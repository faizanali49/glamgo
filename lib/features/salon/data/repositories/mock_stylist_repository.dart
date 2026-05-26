import '../../domain/models/stylist_models.dart';
import '../../domain/repositories/stylist_repository.dart';

class MockStylistRepository implements StylistRepository {
  @override
  Future<List<StylistModel>> getAvailableStylists({String? filterCategory}) async {
    await Future.delayed(const Duration(milliseconds: 350));
    return [
      StylistModel(
        id: 'st_1',
        name: 'Ayesha Khan',
        rating: 4.9,
        yearsExperience: 6,
        specialization: 'Hair Specialist',
        tags: ['MASTER COLORIST', 'STYLING'],
        imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=200',
        availability: StylistAvailability.online,
      ),
      StylistModel(
        id: 'st_2',
        name: 'Ali Ahmed',
        rating: 4.8,
        yearsExperience: 4,
        specialization: 'Beard & Fade Expert',
        tags: ['GROOMING', 'QUICK FADE'],
        imageUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=200',
        availability: StylistAvailability.online,
      ),
      StylistModel(
        id: 'st_3',
        name: 'Sara Malik',
        rating: 5.0,
        yearsExperience: 8,
        specialization: 'Skincare & Nails',
        tags: ['ORGANIC CARE', 'LUXURY SPA'],
        imageUrl: 'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?q=80&w=200',
        availability: StylistAvailability.away,
      ),
    ];
  }
}