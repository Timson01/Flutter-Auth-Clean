import 'package:flutter/material.dart';

class SnackBarService {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static void showSnackBar({required String content}) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 1500),
      backgroundColor: Colors.red,
      content: Text(
        content,
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
    ));
  }
}
