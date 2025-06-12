

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SANAD_MOBILE/presentation/widget/profile/profile_pic.dart';
import 'package:SANAD_MOBILE/presentation/widget/profile/user_info_edit_field.dart';
import 'package:SANAD_MOBILE/domain/controllers/auth_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final AuthController authController;

  @override
  void initState() {
    super.initState();
    authController = Get.find<AuthController>();
    if (authController.user.value == null && !authController.isLoading.value) {
      authController.getProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "EditProfile".tr,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Obx(() {
        final user = authController.user.value;
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProfilePic(),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                  child: Form(
                    child: Column(
                      children: [
                        UserInfoEditField(
                          text: "Name",
                          child: TextFormField(
                            key: ValueKey(user?.fullName ?? ''),
                            initialValue: user?.fullName ?? '',
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                        ),
                        UserInfoEditField(
                          text: "Email",
                          child: TextFormField(
                            key: ValueKey(user?.email ?? ''),
                            initialValue: user?.email ?? '',
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                        ),
                        UserInfoEditField(
                          text: "Phone",
                          child: TextFormField(
                            key: ValueKey(user?.phoneNumber ?? ''),
                            initialValue: user?.phoneNumber ?? '',
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                        ),
                        UserInfoEditField(
                          text: "Address",
                          child: TextFormField(
                            initialValue: '', // No address in user model
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                        ),
                        UserInfoEditField(
                          text: "OldPassword",
                          child: TextFormField(
                            key: const ValueKey('old_password'),
                            obscureText: true,
                            initialValue: '',
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.visibility_off,
                                size: 20,
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                        ),
                        UserInfoEditField(
                          text: "NewPassword",
                          child: TextFormField(
                            key: const ValueKey('new_password'),
                            decoration: InputDecoration(
                              hintText: "NewPassword".tr,
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 120,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.grey, width: 1.2),
                        minimumSize: const Size(double.infinity, 48),
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.white,
                      ),
                      child: Text("Cancel".tr, style: const TextStyle(fontWeight: FontWeight.w500)),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 48),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: Text("SaveUpdate".tr, style: const TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}


