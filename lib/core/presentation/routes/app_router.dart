import 'package:auto_route/auto_route.dart';
import 'package:flutter_auth_clean/features/authorization/presentation/pages/home/home_page.dart';
import 'package:flutter_auth_clean/features/authorization/presentation/pages/login/login_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: LoginPage, initial: true),
    MaterialRoute(page: HomePage)
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
