import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_list_firebase/app/ui/shared/utils/colors/app_colors.dart';

import '../../controllers/home_page_controller.dart';
import '../shared/widgets/home_page_widgets/delete_task_dialog.dart';
import '../shared/widgets/home_page_widgets/task_dialog.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.cyanBlue,
        centerTitle: true,
        title: const Text('To-do List'),
        actions: [
          IconButton(
            onPressed: () {
              homePageController.firebaseController.signOut();
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          child: StreamBuilder(
            stream:
                homePageController.firestore.collection('tasks').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else {
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    final Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    Color taskColor = AppColors.lightBlue;
                    final taskTag = data['taskTag'];
                    if (taskTag == 'Work') {
                      taskColor = AppColors.secondary;
                    } else if (taskTag == 'School') {
                      taskColor = AppColors.primaryBlue;
                    } else if (taskTag == 'Important') {
                      taskColor = Colors.red;
                    }
                    return Container(
                      height: 70,
                      margin: const EdgeInsets.only(bottom: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.white,
                        border: Border.all(width: 3, color: taskColor),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 20,
                          height: 20,
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 5.0,
                          ),
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundColor: taskColor,
                          ),
                        ),
                        title: Text(
                          data['taskName'],
                          style: const TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(
                          data['taskDesc'],
                          style: const TextStyle(fontSize: 14),
                        ),
                        isThreeLine: true,
                        trailing: PopupMenuButton(
                          position: PopupMenuPosition.under,
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                value: 'edit',
                                child: const Text(
                                  'Edit',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                  ),
                                ),
                                onTap: () {
                                  homePageController.updateUserInteractions(
                                    UserInteractions.edit,
                                  );
                                  Future.delayed(
                                    const Duration(milliseconds: 50),
                                    () => showDialog(
                                      context: context,
                                      builder: (context) => TaskDialog(
                                        dialogController: homePageController,
                                        taskDescController: homePageController
                                            .taskDescController,
                                        taskNameController: homePageController
                                            .taskNameController,
                                        taskId: data['id'],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                  ),
                                ),
                                onTap: () {
                                  Future.delayed(
                                    const Duration(milliseconds: 50),
                                    () => showDialog(
                                      context: context,
                                      builder: (context) => DeleteTaskDialog(
                                        dialogController: homePageController,
                                        taskId: data['id'],
                                        taskName: data['taskName'],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ];
                          },
                        ),
                        dense: true,
                      ),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: AppColors.cyanBlue,
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          //
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homePageController.updateUserInteractions(UserInteractions.create);
          showDialog(
            context: context,
            builder: (context) => TaskDialog(
              dialogController: homePageController,
              taskDescController: homePageController.taskDescController,
              taskNameController: homePageController.taskNameController,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         user.email!,
      //         style: const TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       ElevatedButton(
      //         onPressed: () => firebaseController.signOut(),
      //         child: const Text('Sign Out'),
      //       )
      //     ],
      //   ),
      // ),
