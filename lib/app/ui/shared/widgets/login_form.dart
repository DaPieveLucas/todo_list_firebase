import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_firebase/app/controllers/login_controller.dart';
import 'package:todo_list_firebase/app/ui/shared/colors/app_colors.dart';

import 'email_auth_text_field.dart';
import 'password_auth_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailAuthTextField(
            emailController: loginController.emaController,
            emailFormValidator: (value) => loginController
                .emailValidation(loginController.emaController.text),
          ),
          const SizedBox(
            height: 15,
          ),
          PasswordAuthTextField(
            passwordController: loginController.passController,
            passwordFormValidator: (value) =>
                loginController.passwordValidation(
              loginController.passController.text,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Text(
                'Don\'t have an account ?',
                style: TextStyle(fontSize: 14, color: AppColors.secondary),
              ),
              TextButton(
                onPressed: () {
                  log('pressed signup');
                },
                child: const Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 310.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  log('success login');
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
