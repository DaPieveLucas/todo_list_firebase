import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emaController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  String? emailValidation(String value) {
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    if (value.isEmpty) {
      return 'Please enter an email address';
    }
    if (!emailValid) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidation(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }
}
