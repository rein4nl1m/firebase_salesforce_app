import 'package:auto_route/auto_route.dart';
import 'package:firebase_salesforce_app/core/routes/auth_guard.dart';
import '../../presentation/pages/pages.dart';

export 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, guards: [AuthGuard]),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegisterPage, guards: [AuthGuard]),
    AutoRoute(page: ResetPasswordPage, guards: [AuthGuard]),
    AutoRoute(page: SplashScreen, initial: true),
  ],
)
class $AppRouter {}
