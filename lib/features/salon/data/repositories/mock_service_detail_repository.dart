import '../../domain/models/service_detail_models.dart';
import '../../domain/repositories/service_detail_repository.dart';

class MockServiceDetailRepository implements ServiceDetailRepository {
  @override
  Future<ServiceDetailModel> getServiceDetails(String serviceId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return ServiceDetailModel(
      id: serviceId,
      name: 'Haircut',
      startingPrice: 500.0,
      baseDurationMinutes: 30,
      isPopular: true,
      imageUrl: 'https://images.unsplash.com/photo-1560066984-138dadb4c035?q=80&w=600',
      description: 'Professional haircut service including wash, trim, and styling based on your preference. Our experts ensure a personalized experience tailored to your face shape and hair texture.',
      whatsIncluded: [
        'Hair wash with premium shampoo',
        'Precision cut by senior stylist',
        'Professional styling & blow-dry',
        'Final touch & finishing spray',
      ],
    );
  }

  @override
  Future<List<ServiceExpertModel>> getRecommendedExperts(String serviceId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return [
      ServiceExpertModel(id: 'exp_m1', name: 'Alex M.', rating: 4.9, imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200'),
      ServiceExpertModel(id: 'exp_j1', name: 'Sarah J.', rating: 4.8, imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=200'),
      ServiceExpertModel(id: 'exp_k1', name: 'Michael K.', rating: 5.0, imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=200'),
    ];
  }
}