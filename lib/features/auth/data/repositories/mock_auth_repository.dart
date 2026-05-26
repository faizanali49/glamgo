import '../../domain/models/user_auth_model.dart';
import '../../domain/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  String? _pendingPhone;

  @override
  Future<void> sendOtp(String phoneNumber) async {
    await Future.delayed(const Duration(milliseconds: 1200));
    _pendingPhone = phoneNumber;
    // Mimicking structural system verification pass
    if (phoneNumber.contains('00000')) {
      throw Exception('Invalid phone network routing target identifier.');
    }
  }

  @override
  Future<UserAuthModel> verifyOtp(String smsCode) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (smsCode == '1234') {
      return UserAuthModel(
        uid: 'mock_user_992',
        phoneNumber: _pendingPhone ?? '+923001234567',
        status: 'authenticated',
      );
    }
    throw Exception('Incorrect verification OTP digits entered.');
  }

  @override
  Future<UserAuthModel> signInWithGoogle() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return UserAuthModel(
      uid: 'google_user_551',
      email: 'user.glamgo@gmail.com',
      status: 'authenticated',
    );
  }
}
