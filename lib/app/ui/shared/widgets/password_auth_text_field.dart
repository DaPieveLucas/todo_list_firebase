import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class PasswordAuthTextField extends StatelessWidget {
  const PasswordAuthTextField({
    required this.passwordFormValidator,
    required this.passwordController,
    super.key,
  });

  final TextEditingController passwordController;
  final String? Function(String?)? passwordFormValidator;

  static OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(color: AppColors.primary, width: 2),
  );

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(color: Colors.red, width: 5),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: passwordController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15.0),
        filled: true,
        fillColor: AppColors.white,
        hintText: 'Password',
        border: border,
        enabledBorder: border,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      autocorrect: false,
      textInputAction: TextInputAction.done,
      validator: passwordFormValidator,
      obscureText: true,
    );
  }
}
