import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHiddenPassword = true;
  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void login({required String username, required String password}) {
    context
        .read<AuthBloc>()
        .add(AuthUserEvent(username: username, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Введите имя',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                obscureText: isHiddenPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Введите пароль',
                  suffix: InkWell(
                    onTap: togglePasswordView,
                    child: Icon(
                      isHiddenPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () => login(
                          username: usernameController.text,
                          password: passwordController.text),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                      child: const Text("Login")))
            ],
          ),
        ),
      ),
    );
  }
}
