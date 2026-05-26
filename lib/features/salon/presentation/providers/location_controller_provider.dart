import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glamgo/features/salon/repositories/location_repository.dart';

import '../../data/repositories/mock_location_repository.dart';
import '../../domain/models/user_location_model.dart';

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return MockLocationRepository();
});

final locationControllerProvider =
    AsyncNotifierProvider<LocationController, UserLocationModel>(() {
      return LocationController();
    });

class LocationController extends AsyncNotifier<UserLocationModel> {
  @override
  Future<UserLocationModel> build() async {
    return UserLocationModel();
  }

  Future<bool> triggerSystemLocationPermission() async {
    state = const AsyncLoading();
    try {
      final repo = ref.read(locationRepositoryProvider);
      final locationResult = await repo.requestDeviceLocation();
      state = AsyncValue.data(locationResult);
      return locationResult.status == 'granted';
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}
