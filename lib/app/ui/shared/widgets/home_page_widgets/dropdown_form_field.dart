import 'package:flutter/material.dart';
import 'package:todo_list_firebase/app/controllers/home_page_controller.dart';

import '../../utils/colors/app_colors.dart';

class DropdownFormField extends StatelessWidget {
  const DropdownFormField({
    required this.dropdownController,
    required this.hintText,
    super.key,
  });

  final HomePageController dropdownController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
      ),
      items: dropdownController.taskTags.map((itemFromList) {
        return DropdownMenuItem(
          value: itemFromList,
          child: Text(itemFromList),
        );
      }).toList(),
      onChanged: (String? value) {
        dropdownController.changeSelectedValueFromDropdown(value);
      },
    );
  }
}
