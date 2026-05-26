import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../data/repositories/mock_explore_repository.dart';
import '../../domain/models/explore_data_models.dart';

final exploreRepositoryProvider = Provider<ExploreRepository>((ref) {
  return MockExploreRepository();
});

final activeFilterTagProvider = StateProvider<String>((ref) => '4+ Rating');

final exploreSalonsProvider = FutureProvider<List<ExploreSalonModel>>((ref) async {
  final activeFilter = ref.watch(activeFilterTagProvider);
  return ref.watch(exploreRepositoryProvider).fetchExplorationSalons(activeFilterTag: activeFilter);
});