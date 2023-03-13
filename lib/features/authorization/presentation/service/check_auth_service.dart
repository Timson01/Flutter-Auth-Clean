import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_auth_clean/core/presentation/routes/app_router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/auth_bloc.dart';

class CheckAuthService extends StatefulWidget {
  const CheckAuthService({super.key});

  @override
  State<CheckAuthService> createState() => _CheckAuthServiceState();
}

class _CheckAuthServiceState extends State<CheckAuthService> {
  @override
  void initState() {
    context.read<AuthBloc>().add(CheckAuthStatusEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          AutoRouter.of(context).replace(const HomeRoute());
        } else {
          AutoRouter.of(context).replace(const LoginRoute());
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
