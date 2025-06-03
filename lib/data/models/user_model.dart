// lib/data/models/user_model.dart
class UserModel {
  final String id;
  final String phoneNumber;
  final String email;
  final String fullName;
  final String role;

  UserModel({
    required this.id,
    required this.phoneNumber,
    required this.email,
    required this.fullName,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? json['userId'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        email: json['email'] ?? '',
        fullName: json['fullName'] ?? '',
        role: json['role'] ?? '',
      );
}
