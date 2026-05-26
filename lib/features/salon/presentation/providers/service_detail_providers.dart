import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hbazar/features/salon/domain/repositories/service_detail_repository.dart';
import '../../data/repositories/mock_service_detail_repository.dart';
import '../../domain/models/service_detail_models.dart';

final serviceDetailRepositoryProvider = Provider<ServiceDetailRepository>((ref) {
  return MockServiceDetailRepository();
});

final serviceDetailDataStreamProvider = FutureProvider.family.autoDispose<ServiceDetailModel, String>((ref, id) async {
  return ref.watch(serviceDetailRepositoryProvider).getServiceDetails(id);
});

final serviceExpertsStreamProvider = FutureProvider.family.autoDispose<List<ServiceExpertModel>, String>((ref, id) async {
  return ref.watch(serviceDetailRepositoryProvider).getRecommendedExperts(id);
});

// UI Interactivity Selection Providers
final selectedGenderProvider = StateProvider.autoDispose<String>((ref) => 'Male');
final selectedStyleTypeProvider = StateProvider.autoDispose<String>((ref) => 'Classic');
final selectedPreferredStaffIdProvider = StateProvider.autoDispose<String?>((ref) => null);