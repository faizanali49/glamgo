import '../models/service_detail_models.dart';

abstract class ServiceDetailRepository {
  Future<ServiceDetailModel> getServiceDetails(String serviceId);
  Future<List<ServiceExpertModel>> getRecommendedExperts(String serviceId);
}