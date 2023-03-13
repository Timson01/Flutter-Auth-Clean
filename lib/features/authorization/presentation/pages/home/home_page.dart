import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Home Page"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(LogoutEvent());
                AutoRouter.of(context).navigateNamed('/login-page');
              },
              icon: const Icon(Icons.logout_rounded)),
          backgroundColor: Colors.orangeAccent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)))),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Get Note:",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          SizedBox(height: 20),
          SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  child: const Text("Login",
                      style: TextStyle(fontSize: 15, color: Colors.white))))
        ],
      )),
    );
  }
}
