import 'package:auto_route/auto_route.dart';
import 'package:firebase_salesforce_app/core/routes/router.dart';
import '/core/di/injectable.dart';
import '/presentation/pages/home/controller/home_controller.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    var homeControoller = getIt<HomeController>();

    var isAuthenticated = homeControoller.userProfile != null;

    if (!isAuthenticated) {
      // ignore: unawaited_futures
      router.push(
        LoginPageRoute(
            // onLoginResult: (_) {
            //   isAuthenticated = true;
            //   // we can't pop the bottom page in the navigator's stack
            //   // so we just remove it from our local stack
            //   router.popForced();
            //   resolver.next();
            // },
            ),
      );
    } else {
      resolver.next(true);
    }
  }
}
