import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hbazar/features/salon/domain/repositories/salon_detail_repository.dart';
import '../../data/repositories/mock_salon_detail_repository.dart';
import '../../domain/models/salon_detail_models.dart';

final salonDetailRepositoryProvider = Provider<SalonDetailRepository>((ref) {
  return MockSalonDetailRepository();
});

// Auto-disposes state when moving away from screen to maintain optimal memory consumption
final salonDetailProvider = FutureProvider.family.autoDispose<SalonDetailModel, String>((ref, id) async {
  return ref.watch(salonDetailRepositoryProvider).getSalonDetails(id);
});

// Manages the list of selected service IDs for checkout calculations
final selectedServicesProvider = StateNotifierProvider.autoDispose<SelectedServicesNotifier, Set<String>>((ref) {
  return SelectedServicesNotifier();
});

class SelectedServicesNotifier extends StateNotifier<Set<String>> {
  SelectedServicesNotifier() : super({});

  void toggleService(String serviceId) {
    if (state.contains(serviceId)) {
      state = {...state}..remove(serviceId);
    } else {
      state = {...state, serviceId};
    }
  }
}