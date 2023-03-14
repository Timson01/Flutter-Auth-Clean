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
}
