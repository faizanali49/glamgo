class UserLocationModel {
  final double? latitude;
  final double? longitude;
  final String? addressName;
  final String status; // 'unknown' | 'granted' | 'denied' | 'manual'

  UserLocationModel({
    this.latitude,
    this.longitude,
    this.addressName,
    this.status = 'unknown',
  });

  UserLocationModel copyWith({
    double? latitude,
    double? longitude,
    String? addressName,
    String? status,
  }) {
    return UserLocationModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      addressName: addressName ?? this.addressName,
      status: status ?? this.status,
    );
  }
}