import '../models/salon_detail_models.dart';

abstract class SalonDetailRepository {
  Future<SalonDetailModel> getSalonDetails(String salonId);
}