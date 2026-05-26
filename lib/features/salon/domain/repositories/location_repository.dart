import '../models/user_location_model.dart';

abstract class LocationRepository {
  Future<UserLocationModel> requestDeviceLocation();
  Future<UserLocationModel> setManualLocation(String addressName);
  bool hasSavedLocation(); // The routing checkpoint method
}