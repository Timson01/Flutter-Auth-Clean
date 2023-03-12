import 'package:flutter/material.dart';
import 'package:flutter_auth_clean/core/presentation/routes/app_router.gr.dart';
import 'package:flutter_auth_clean/features/authorization/data/repository/auth_user_repository.dart';
import 'package:flutter_auth_clean/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/authorization/domain/bloc/auth_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: locator<AuthUserRepository>()),
      child: MaterialApp.router(
        title: 'Flutter Auth',
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
