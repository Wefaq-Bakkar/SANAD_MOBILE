import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "UsernameValidate".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "EmailValidate".tr;
    }
  }

  if (type == "password") {
    if (val.isEmpty) {
      return "PasswordValidate".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "PhoneValidate".tr;
    }
  }

  if (val.isEmpty) {
    return "EmptyValidate".tr;
  }

  if (val.length < min) {
    return "MinValidate".tr;
  }

  if (val.length > max) {
    return "MaxValidate".tr;
  }
}
