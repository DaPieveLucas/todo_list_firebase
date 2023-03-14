import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_firebase/app/ui/shared/utils/colors/app_colors.dart';

import '../../../../controllers/home_page_controller.dart';
import '../../../../services/image_picker_service.dart';
import 'dialog_form_field.dart';
import 'dropdown_form_field.dart';
import 'user_interactions_action_button.dart';

class TaskDialog extends StatelessWidget {
  TaskDialog({
    required this.dialogController,
    required this.taskNameController,
    required this.taskDescController,
    required this.dialogActionName,
    this.taskId,
    super.key,
  });

  final TextEditingController taskDescController;
  final TextEditingController taskNameController;
  final HomePageController dialogController;
  final ImagePickerService pickerService = ImagePickerService();
  final String dialogActionName;
  final String? taskId;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const spacer = SizedBox(
      height: 15,
    );

    return AlertDialog(
      scrollable: true,
      title: Text(
        dialogActionName,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: AppColors.black),
      ),
      content: SizedBox(
        height: height * 0.35,
        width: width,
        child: Form(
          child: Column(
            children: [
              DialogFormField(
                hintText: 'Task',
                ledingIcon: CupertinoIcons.square_list,
                textInputController: taskNameController,
              ),
              spacer,
              DialogFormField(
                hintText: 'Descprition',
                ledingIcon: CupertinoIcons.bubble_left_bubble_right,
                textInputController: taskDescController,
              ),
              spacer,
              DropdownFormField(
                hintText: 'Task tags',
                dropdownController: dialogController,
              )
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            pickerService.uploadImageToFirebaseStorage();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
          ),
          child: const Text('Upload Photo'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          child: const Text('Cancel'),
        ),
        UserInteractionActionButton(
          interactionsController: dialogController,
          taskId: taskId,
        )
      ],
    );
  }
}
