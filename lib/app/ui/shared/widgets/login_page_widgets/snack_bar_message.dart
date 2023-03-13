import 'package:flutter/material.dart';

class SnackBarMessage {
  SnackBarMessage._();

  static final instance = SnackBarMessage._();

  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  showSnackBar(String? text) {
    if (text == null) {
      return;
    }
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    scaffoldKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
