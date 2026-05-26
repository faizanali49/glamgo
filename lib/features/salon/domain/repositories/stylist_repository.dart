import '../models/stylist_models.dart';

abstract class StylistRepository {
  Future<List<StylistModel>> getAvailableStylists({String? filterCategory});
}