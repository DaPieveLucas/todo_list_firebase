import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:todo_list_firebase/app/controllers/auth_controller.dart';
import 'package:todo_list_firebase/app/ui/shared/utils/colors/app_colors.dart';

import 'email_auth_text_field.dart';
import 'password_auth_text_field.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    required this.buttonMessage,
    required this.actionMessage,
    required this.userMessage,
    required this.onClickedSignup,
    required this.controller,
    super.key,
  });
  final VoidCallback onClickedSignup;
  final AuthController controller;
  final String userMessage;
  final String buttonMessage;
  final String actionMessage;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.formKey,
      child: Column(
        children: [
          EmailAuthTextField(
            emailController: widget.controller.emaController,
            emailFormValidator: (value) => widget.controller
                .emailValidation(widget.controller.emaController.text),
          ),
          const SizedBox(
            height: 15,
          ),
          PasswordAuthTextField(
            passwordController: widget.controller.passController,
            passwordFormValidator: (value) =>
                widget.controller.passwordValidation(
              widget.controller.passController.text,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: AppColors.secondary),
              text: widget.userMessage,
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignup,
                  text: widget.buttonMessage,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () => widget.controller.isLogin.value
                  ? widget.controller.signIn()
                  : widget.controller.signUp(),
              child: Text(
                widget.actionMessage,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
