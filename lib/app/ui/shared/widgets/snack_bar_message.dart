import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static final instance = Utils._();

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
