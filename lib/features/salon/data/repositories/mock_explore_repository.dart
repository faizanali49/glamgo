import '../../domain/models/explore_data_models.dart';

abstract class ExploreRepository {
  Future<List<ExploreSalonModel>> fetchExplorationSalons({String? activeFilterTag});
}

class MockExploreRepository implements ExploreRepository {
  @override
  Future<List<ExploreSalonModel>> fetchExplorationSalons({String? activeFilterTag}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final elements = [
      ExploreSalonModel(
        id: 'exp_001',
        name: 'The Velvet Touch Spa',
        rating: 4.8,
        reviewsCount: 1500,
        distanceKm: 0.8,
        landmarkName: 'Jubilee Hills',
        startingPrice: 850.0,
        thumbnailImg: 'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=600',
        tags: ['Hair', 'Facial', 'Manicure'],
        isTrending: true,
      ),
      ExploreSalonModel(
        id: 'exp_002',
        name: 'Modern Groomers',
        rating: 4.6,
        reviewsCount: 900,
        distanceKm: 1.5,
        landmarkName: 'Banjara Hills',
        startingPrice: 500.0,
        thumbnailImg: 'https://images.unsplash.com/photo-1503951914875-452162b0f3f1?q=80&w=600',
        tags: ['Beard', 'Haircut', 'Massage'],
        hasHomeService: true,
      ),
      ExploreSalonModel(
        id: 'exp_003',
        name: 'Pure Esthetica',
        rating: 4.9,
        reviewsCount: 400,
        distanceKm: 2.1,
        landmarkName: 'Madhapur',
        startingPrice: 1200.0,
        thumbnailImg: 'https://images.unsplash.com/photo-1629909613654-28e377c37b09?q=80&w=600',
        tags: ['Coloring', 'Spa'],
      ),
    ];

    if (activeFilterTag == null || activeFilterTag == 'Nearest' || activeFilterTag == 'Low Price') {
      return elements;
    }
    // Simple mock filter matching
    return elements.where((s) => s.rating >= 4.7).toList();
  }
}