import 'package:glamgo/features/salon/domain/models/user_location_model.dart';

abstract class LocationRepository {
  Future<UserLocationModel> requestDeviceLocation();
  Future<UserLocationModel> setManualLocation(String addressName);
}
