import '../models/home_data_models.dart';

abstract class HomeRepository {
  Future<List<CategoryModel>> getCategories();
  Future<List<OfferBannerModel>> getActiveOffers();
  Future<List<SalonSummaryModel>> getNearbySalons();
}