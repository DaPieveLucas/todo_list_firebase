import 'package:flutter/material.dart';
import 'package:todo_list_firebase/app/controllers/home_page_controller.dart';

import '../../utils/colors/app_colors.dart';

class DeleteTaskDialog extends StatelessWidget {
  const DeleteTaskDialog({
    required this.dialogController,
    required this.taskId,
    required this.taskName,
    super.key,
  });

  final String taskId;
  final String taskName;
  final HomePageController dialogController;

  final SizedBox spacer = const SizedBox(
    height: 15,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Delete task',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: AppColors.black),
      ),
      content: SizedBox(
        height: 80,
        child: Column(
          children: [
            const Text(
              'Are you sure you want to delete this task ?',
              style: TextStyle(fontSize: 14),
            ),
            spacer,
            Text(
              taskName,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            spacer
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            dialogController.deleteTasks(taskId: taskId);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
