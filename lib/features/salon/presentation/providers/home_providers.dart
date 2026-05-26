import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../data/repositories/mock_home_repository.dart';
import '../../domain/models/home_data_models.dart';
import '../../domain/repositories/home_repository.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return MockHomeRepository();
});

final homeCategoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  return ref.watch(homeRepositoryProvider).getCategories();
});

final homeOffersProvider = FutureProvider<List<OfferBannerModel>>((ref) async {
  return ref.watch(homeRepositoryProvider).getActiveOffers();
});

final nearbySalonsProvider = FutureProvider<List<SalonSummaryModel>>((ref) async {
  return ref.watch(homeRepositoryProvider).getNearbySalons();
});

// Controls selected quick-filter category chip row interaction state
final selectedCategoryProvider = StateProvider<String>((ref) => 'cat_1');

// Home-service toggle switch indicator state
final homeServiceToggleProvider = StateProvider<bool>((ref) => false);