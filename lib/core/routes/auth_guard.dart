import 'package:auto_route/auto_route.dart';
import 'package:firebase_salesforce_app/core/routes/router.dart';

var isAuthenticated = false;

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (!isAuthenticated) {
      // ignore: unawaited_futures
      router.push(
        LoginPageRoute(
          onLoginResult: (_) {
            isAuthenticated = true;
            // we can't pop the bottom page in the navigator's stack
            // so we just remove it from our local stack
            router.popForced();
            resolver.next();
          },
        ),
      );
    } else {
      resolver.next(true);
    }
  }
}
