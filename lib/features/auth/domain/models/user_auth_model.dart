class UserAuthModel {
  final String? uid;
  final String? phoneNumber;
  final String? email;
  final String status; // 'unauthenticated' | 'otp_sent' | 'authenticated'

  UserAuthModel({
    this.uid,
    this.phoneNumber,
    this.email,
    this.status = 'unauthenticated',
  });

  UserAuthModel copyWith({
    String? uid,
    String? phoneNumber,
    String? email,
    String? status,
  }) {
    return UserAuthModel(
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }
}