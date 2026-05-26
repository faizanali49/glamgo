import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hbazar/features/salon/domain/repositories/stylist_repository.dart';
import '../../data/repositories/mock_stylist_repository.dart';
import '../../domain/models/stylist_models.dart';

final stylistRepositoryProvider = Provider<StylistRepository>((ref) {
  return MockStylistRepository();
});

final activeFilterProvider = StateProvider.autoDispose<String>((ref) => 'Top Rated');

final stylistsStreamProvider = FutureProvider.autoDispose<List<StylistModel>>((ref) async {
  final category = ref.watch(activeFilterProvider);
  return ref.watch(stylistRepositoryProvider).getAvailableStylists(filterCategory: category);
});

// Selection strategy: Null means 'Next Available Expert' is active
final selectedStylistIdProvider = StateProvider.autoDispose<String?>((ref) => null);