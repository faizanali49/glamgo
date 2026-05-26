import '../models/user_auth_model.dart';

abstract class AuthRepository {
  Future<void> sendOtp(String phoneNumber);
  Future<UserAuthModel> verifyOtp(String smsCode);
  Future<UserAuthModel> signInWithGoogle();
}