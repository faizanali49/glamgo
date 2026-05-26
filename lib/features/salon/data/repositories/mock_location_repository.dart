import 'package:hbazar/features/salon/repositories/location_repository.dart';

import '../../domain/models/user_location_model.dart';

class MockLocationRepository implements LocationRepository {
  @override
  Future<UserLocationModel> requestDeviceLocation() async {
    // Simulate OS system dialog response latency
    await Future.delayed(const Duration(milliseconds: 1500));
    return UserLocationModel(
      latitude: 32.5731,
      longitude: 74.0789,
      addressName: 'Gujrat, Punjab, Pakistan',
      status: 'granted',
    );
  }

  @override
  Future<UserLocationModel> setManualLocation(String addressName) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return UserLocationModel(
      latitude: 32.5731,
      longitude: 74.0789,
      addressName: addressName,
      status: 'manual',
    );
  }
}