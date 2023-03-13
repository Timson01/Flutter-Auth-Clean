import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/auth_bloc.dart';

class LoginPageController {
  static void submitForm(
      {required String username,
      required String password,
      required BuildContext context}) {
    if (username == '' || password == "") return;
    context.read<AuthBloc>().add(AuthUserEvent(
        username: username, password: password, context: context));
  }

  static void showSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 1500),
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    ));
  }
}
