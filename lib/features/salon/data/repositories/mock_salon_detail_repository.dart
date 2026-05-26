import '../../domain/models/salon_detail_models.dart';
import '../../domain/repositories/salon_detail_repository.dart';

class MockSalonDetailRepository implements SalonDetailRepository {
  @override
  Future<SalonDetailModel> getSalonDetails(String salonId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return SalonDetailModel(
      id: salonId,
      name: 'The Velvet Touch Spa',
      rating: 4.7,
      reviewsCount: 1240,
      address: 'No. 45, 1st Floor, Pride Elite, MG Road, near Trinity Metro, Bengaluru, Karnataka 560001',
      description: 'Professional salon offering premium grooming and beauty services with trained staff and modern equipment. Experience luxury in every touch at our award-winning facility.',
      bannerImageUrl: 'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?q=80&w=800',
      services: [
        ServiceModel(id: 's1', name: 'Haircut', durationMinutes: 30, specializationType: 'Specialized Stylist', price: 500),
        ServiceModel(id: 's2', name: 'Beard Trim', durationMinutes: 20, specializationType: 'Precision Edging', price: 300),
        ServiceModel(id: 's3', name: 'Facial', durationMinutes: 45, specializationType: 'Deep Cleansing', price: 800),
        ServiceModel(id: 's4', name: 'Hair Styling', durationMinutes: 40, specializationType: 'Occasion Styling', price: 600),
        ServiceModel(id: 's5', name: 'Hair Coloring', durationMinutes: 90, specializationType: 'Global/Highlights', price: 1500),
      ],
      experts: [
        ExpertModel(id: 'e1', name: 'Alex H.', rating: 4.9, imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200'),
        ExpertModel(id: 'e2', name: 'Sarah K.', rating: 4.8, imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=200'),
        ExpertModel(id: 'e3', name: 'Michael W.', rating: 5.0, imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=200'),
      ],
      topReviews: [
        ReviewSummaryModel(reviewerName: 'Priya S.', relativeTime: '2 days ago', comment: 'Very professional service. The staff is highly skilled and the environment is exceptionally clean.'),
        ReviewSummaryModel(reviewerName: 'Rahul M.', relativeTime: '1 week ago', comment: 'Best haircut I\'ve had in Bangalore. Premium feel throughout the session. Highly recommended!'),
      ],
    );
  }
}