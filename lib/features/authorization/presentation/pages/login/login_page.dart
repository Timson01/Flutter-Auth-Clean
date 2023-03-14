import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_clean/features/authorization/domain/bloc/auth_bloc.dart';
import 'package:flutter_auth_clean/features/authorization/presentation/utils/login_page_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/password_text_field.dart';
import 'components/user_name_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.deepPurpleAccent,
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                AutoRouter.of(context).replaceNamed('/home-page');
              }
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserNameTextField(controller: usernameController),
                    const SizedBox(height: 10),
                    PasswordTextField(controller: passwordController),
                    const SizedBox(height: 20),
                    SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () => LoginPageController.submitForm(
                                username: usernameController.text,
                                password: passwordController.text,
                                context: context),
                            style: ButtonStyle(
                                backgroundColor:
                                    const MaterialStatePropertyAll<Color>(
                                        Colors.orangeAccent),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                            child: const Text("Login")))
                  ],
                ),
              );
            },
          )),
    );
  }
}
