import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_page_controller.dart';
import '../../utils/colors/app_colors.dart';

class UserInteractionActionButton extends StatelessWidget {
  const UserInteractionActionButton({
    required this.taskId,
    required this.interactionsController,
    super.key,
  });

  final HomePageController interactionsController;
  final String? taskId;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (interactionsController.interactions.value) {
        case UserInteractions.create:
          return ElevatedButton(
            onPressed: () {
              interactionsController.addTasks();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: const Text('Save'),
          );

        case UserInteractions.edit:
          return ElevatedButton(
            onPressed: () {
              interactionsController.updateTasks(taskId: taskId);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: const Text('Edit'),
          );

        case UserInteractions.idle:
          return Container();
      }
    });
  }
}
