import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final taskNameController = TextEditingController();
  final taskDescController = TextEditingController();
  final firebaseController = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Rx<UserInteractions> interactions = Rx(UserInteractions.idle);

  final List<String> taskTags = ['Work', 'School', 'Other', 'Important'];
  String? selectedValueFromList;

  String? changeSelectedValueFromDropdown(String? newValueFromDropdown) {
    return selectedValueFromList = newValueFromDropdown;
  }

  void updateUserInteractions(UserInteractions newInteraction) {
    interactions.value = newInteraction;
  }

  Future addTasks() async {
    final DocumentReference docRef = await firestore.collection('tasks').add(
      {
        'taskName': taskNameController.text,
        'taskDesc': taskDescController.text,
        'taskTag': selectedValueFromList,
      },
    );
    final String taskId = docRef.id;
    await firestore.collection('tasks').doc(taskId).update(
      {'id': taskId},
    );
    clearFields();
  }

  Future updateTasks({required String? taskId}) async {
    final collection = firestore.collection('tasks');

    await collection
        .doc(taskId)
        .update({
          'taskName': taskNameController.text,
          'taskDesc': taskDescController.text,
          'taskTag': selectedValueFromList,
        })
        .then(
          (_) => Fluttertoast.showToast(
            msg: 'Task updated successfully',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 14.0,
          ),
        )
        .catchError(
          (error) => Fluttertoast.showToast(
            msg: 'Failed: $error',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 14.0,
          ),
        );
  }

  Future deleteTasks({required String? taskId}) async {
    final collection = firestore.collection('tasks');
    await collection
        .doc(taskId)
        .delete()
        .then(
          (_) => Fluttertoast.showToast(
            msg: 'Task deleted successfully',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 14.0,
          ),
        )
        .catchError(
          (error) => Fluttertoast.showToast(
            msg: 'Failed: $error',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 14.0,
          ),
        );
  }

  void clearFields() {
    taskNameController.text = '';
    taskDescController.text = '';
  }
}

enum UserInteractions { idle, create, edit }
