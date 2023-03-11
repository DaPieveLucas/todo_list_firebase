import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_firebase/app/ui/shared/widgets/snack_bar_message.dart';

class AuthController extends GetxController {
  final TextEditingController emaController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  RxBool isLogin = false.obs;
  final formKey = GlobalKey<FormState>();

  //validações textField
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
    if (value.length < 6) {
      return 'It needs to be at least 6 characters long';
    }
    return null;
  }

  //Executar método de login
  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      //criar validação para caso informar senha errada
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emaController.text.trim(),
        password: passController.text.trim(),
      );

      cleanTextField();
    } on FirebaseAuthException catch (e) {
      Utils.instance.showSnackBar(e.message);
    }
  }

  //Executar método de signup
  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emaController.text.trim(),
        password: passController.text.trim(),
      );

      cleanTextField();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      Utils.instance.showSnackBar(e.message);
    }
  }

  // Mudar páginas de login para signup e vice versa
  void toggle() => isLogin.value = !isLogin.value;

  void cleanTextField() {
    emaController.clear();
    passController.clear();
  }

  @override
  void onClose() {
    emaController.dispose();
    passController.dispose();
    super.onClose();
  }
}
