import 'package:auto_route/auto_route.dart';

import '../../../features/authorization/presentation/pages/home/home_page.dart';
import '../../../features/authorization/presentation/pages/login/login_page.dart';
import '../../../features/authorization/presentation/service/check_auth_service.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: CheckAuthService, initial: true),
    MaterialRoute(page: LoginPage),
    MaterialRoute(page: HomePage)
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
