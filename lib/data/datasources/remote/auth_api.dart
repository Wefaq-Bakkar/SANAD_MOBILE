// lib/data/datasources/remote/auth_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/constants/api_constants.dart';

class AuthApi {
  static Future<http.Response> loginWithPassword(String phone, String password) {
    return http.post(
      Uri.parse('${ApiConstants.baseUrl}/auth/login/password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phoneNumber': phone, 'password': password}),
    );
  }

  static Future<http.Response> requestOtp(String phone) {
    return http.post(
      Uri.parse('${ApiConstants.baseUrl}/auth/login/request-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phoneNumber': phone}),
    );
  }

  static Future<http.Response> completeOtp(String phone, String otp) {
    return http.post(
      Uri.parse('${ApiConstants.baseUrl}/auth/login/complete-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phoneNumber': phone, 'otpCode': otp}),
    );
  }

  static Future<http.Response> resendOtp(String phone) {
    return http.post(
      Uri.parse('${ApiConstants.baseUrl}/auth/login/resend-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phoneNumber': phone}),
    );
  }

  static Future<http.Response> logout(String token) {
    return http.post(
      Uri.parse('${ApiConstants.baseUrl}/auth/logout'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  static Future<http.Response> getProfile(String token) {
    return http.get(
      Uri.parse('${ApiConstants.baseUrl}/auth/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      
    );
    
  }
}
