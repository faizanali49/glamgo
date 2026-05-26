import '../../domain/models/home_data_models.dart';
import '../../domain/repositories/home_repository.dart';

class MockHomeRepository implements HomeRepository {
  @override
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      CategoryModel(id: 'cat_1', name: 'Haircut'),
      CategoryModel(id: 'cat_2', name: 'Beard'),
      CategoryModel(id: 'cat_3', name: 'Facial'),
      CategoryModel(id: 'cat_4', name: 'Makeup'),
    ];
  }

  @override
  Future<List<OfferBannerModel>> getActiveOffers() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return [
      OfferBannerModel(
        id: 'off_1',
        title: 'Flat 20% OFF Today',
        description: 'On first booking in selected salons',
        discountPercentage: 20.0,
        imageUrl: '',
      ),
    ];
  }

  @override
  Future<List<SalonSummaryModel>> getNearbySalons() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      SalonSummaryModel(
        id: 'salon_001',
        name: 'The Vogue Artistry',
        rating: 4.8,
        distanceKm: 1.2,
        locationName: 'Beverly Hills',
        startingPrice: 500.0,
        imageUrl: 'https://images.unsplash.com/photo-1560066984-138dadb4c035?q=80&w=600',
      ),
      SalonSummaryModel(
        id: 'salon_002',
        name: 'Glow & Grace Studio',
        rating: 4.6,
        distanceKm: 2.5,
        locationName: 'Downtown',
        startingPrice: 850.0,
        imageUrl: 'https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?q=80&w=600',
      ),
    ];
  }
}