import 'package:flutter/material.dart';
import 'package:flutter_auth_clean/core/presentation/routes/app_router.gr.dart';
import 'package:flutter_auth_clean/core/presentation/service/snackbar_service.dart';
import 'package:flutter_auth_clean/features/authorization/data/repository/auth_repository_impl.dart';
import 'package:flutter_auth_clean/features/notes/domain/bloc/notes_bloc.dart';
import 'package:flutter_auth_clean/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/authorization/domain/bloc/auth_bloc.dart';
import 'features/notes/data/repository/notes_repository_impl.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AuthBloc(authRepository: locator<AuthUserRepositoryImpl>())),
        BlocProvider(
            create: (context) =>
                NotesBloc(notesRepository: locator<NotesRepositoryImpl>())),
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: SnackBarService.scaffoldKey,
        title: 'Flutter Auth',
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
