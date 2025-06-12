import 'dart:convert';
import 'package:get/get.dart';
import '../../data/datasources/remote/auth_api.dart';
import '../../data/models/user_model.dart';
import '../../core/services/service.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    token.value = myServices.sharedPreferences.getString('token') ?? '';
  }
  final MyServices myServices = Get.find();
  Rxn<UserModel> user = Rxn<UserModel>();
  RxString token = ''.obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  bool get isLoggedIn => (token.value.isNotEmpty || myServices.sharedPreferences.getString('token') != null);

  Future<bool> loginWithPassword(String phone, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    final response = await AuthApi.loginWithPassword(phone, password);
    final data = jsonDecode(response.body);
    isLoading.value = false;
    if (data['success'] == true) {
      token.value = data['data']['accessToken'];
      user.value = UserModel.fromJson(data['data']['user']);
      await myServices.sharedPreferences.setString('token', token.value);
      return true;
    } else {
      errorMessage.value = data['message'] ?? 'Login failed';
      return false;
    }
  }

  Future<bool> requestOtp(String phone) async {
    isLoading.value = true;
    errorMessage.value = '';
    final response = await AuthApi.requestOtp(phone);
    final data = jsonDecode(response.body);
    isLoading.value = false;
    if (data['success'] == true) {
      return true;
    } else {
      errorMessage.value = data['message'] ?? 'OTP request failed';
      return false;
    }
  }

  Future<bool> completeOtp(String phone, String otp) async {
    isLoading.value = true;
    errorMessage.value = '';
    final response = await AuthApi.completeOtp(phone, otp);
    final data = jsonDecode(response.body);
    isLoading.value = false;
    if (data['success'] == true) {
      token.value = data['data']['accessToken'];
      user.value = UserModel.fromJson(data['data']['user']);
      await myServices.sharedPreferences.setString('token', token.value);
      return true;
    } else {
      errorMessage.value = data['message'] ?? 'OTP verification failed';
      return false;
    }
  }

  Future<bool> resendOtp(String phone) async {
    isLoading.value = true;
    errorMessage.value = '';
    final response = await AuthApi.resendOtp(phone);
    final data = jsonDecode(response.body);
    isLoading.value = false;
    if (data['success'] == true) {
      return true;
    } else {
      errorMessage.value = data['message'] ?? 'Resend OTP failed';
      return false;
    }
  }

  Future<void> logout() async {
    await AuthApi.logout(token.value);
    token.value = '';
    user.value = null;
    await myServices.sharedPreferences.remove('token');
  }

  Future<void> getProfile() async {
    isLoading.value = true;
    errorMessage.value = '';
    print('Sending getProfile request with token: $token');
    final response = await AuthApi.getProfile(token.value);
    print('getProfile response: ${response.body}');
    final data = jsonDecode(response.body);
    isLoading.value = false;
    if (data['success'] == true) {
      user.value = UserModel.fromJson(data['data']);
    } else {
      errorMessage.value = data['message'] ?? 'Failed to get profile';
    }
  }
}
