import 'package:auto_route/auto_route.dart';
import '../../presentation/pages/pages.dart';

export 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomePage),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegisterPage),
    AutoRoute(page: ResetPasswordPage),
    AutoRoute(page: SplashScreen, initial: true),
  ],
)
class $AppRouter {}
