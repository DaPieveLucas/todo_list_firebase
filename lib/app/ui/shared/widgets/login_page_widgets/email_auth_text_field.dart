import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

class EmailAuthTextField extends StatelessWidget {
  const EmailAuthTextField({
    required this.emailFormValidator,
    required this.emailController,
    super.key,
  });

  final TextEditingController emailController;
  final String? Function(String?)? emailFormValidator;

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
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15.0),
        filled: true,
        fillColor: AppColors.white,
        hintText: 'Email',
        border: border,
        enabledBorder: border,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      autocorrect: false,
      textInputAction: TextInputAction.next,
      validator: emailFormValidator,
    );
  }
}
