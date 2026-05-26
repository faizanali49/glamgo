import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/user_auth_model.dart';
import 'auth_repository_provider.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthController, UserAuthModel>(() {
      return AuthController();
    });

class AuthController extends AsyncNotifier<UserAuthModel> {
  @override
  Future<UserAuthModel> build() async {
    return UserAuthModel();
  }

  Future<bool> requestOtpCode(String rawPhoneNumber) async {
    state = const AsyncLoading();
    try {
      final repo = ref.read(authRepositoryProvider);
      await repo.sendOtp(rawPhoneNumber);
      state = AsyncValue.data(
        UserAuthModel(phoneNumber: rawPhoneNumber, status: 'otp_sent'),
      );
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<void> loginWithGoogleAccount() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      return await repo.signInWithGoogle();
    });
  }

  // Append these methods inside your existing AuthController class

  Future<bool> verifyOtpCode(String smsCode) async {
    state = const AsyncLoading();
    try {
      final repo = ref.read(authRepositoryProvider);
      final userModel = await repo.verifyOtp(smsCode);
      state = AsyncValue.data(userModel);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> resendOtpCode() async {
    final currentPhone = state.value?.phoneNumber;
    if (currentPhone == null) return false;

    try {
      final repo = ref.read(authRepositoryProvider);
      await repo.sendOtp(currentPhone);
      return true;
    } catch (e) {
      return false;
    }
  }
}
