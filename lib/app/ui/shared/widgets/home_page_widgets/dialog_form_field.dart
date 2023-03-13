import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

class DialogFormField extends StatelessWidget {
  const DialogFormField({
    required this.hintText,
    required this.ledingIcon,
    required this.textInputController,
    super.key,
  });

  final String hintText;
  final IconData ledingIcon;
  final TextEditingController textInputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textInputController,
      style: const TextStyle(
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14),
        icon: Icon(
          ledingIcon,
          color: AppColors.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
