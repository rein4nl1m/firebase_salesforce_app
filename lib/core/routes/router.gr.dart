// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../presentation/pages/pages.dart' as _i4;
import 'auth_guard.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter(
      {_i2.GlobalKey<_i2.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.HomePage();
        }),
    LoginPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LoginPageRouteArgs>(
              orElse: () => const LoginPageRouteArgs());
          return _i4.LoginPage(
              key: args.key, onLoginResult: args.onLoginResult);
        }),
    RegisterPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.RegisterPage();
        }),
    ResetPasswordPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.ResetPasswordPage();
        }),
    SplashScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.SplashScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomePageRoute.name,
            path: '/home-page', guards: [authGuard]),
        _i1.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i1.RouteConfig(RegisterPageRoute.name,
            path: '/register-page', guards: [authGuard]),
        _i1.RouteConfig(ResetPasswordPageRoute.name,
            path: '/reset-password-page', guards: [authGuard]),
        _i1.RouteConfig(SplashScreenRoute.name, path: '/')
      ];
}

class HomePageRoute extends _i1.PageRouteInfo {
  const HomePageRoute() : super(name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

class LoginPageRoute extends _i1.PageRouteInfo<LoginPageRouteArgs> {
  LoginPageRoute({_i2.Key? key, void Function(bool)? onLoginResult})
      : super(name,
            path: '/login-page',
            args: LoginPageRouteArgs(key: key, onLoginResult: onLoginResult));

  static const String name = 'LoginPageRoute';
}

class LoginPageRouteArgs {
  const LoginPageRouteArgs({this.key, this.onLoginResult});

  final _i2.Key? key;

  final void Function(bool)? onLoginResult;
}

class RegisterPageRoute extends _i1.PageRouteInfo {
  const RegisterPageRoute() : super(name, path: '/register-page');

  static const String name = 'RegisterPageRoute';
}

class ResetPasswordPageRoute extends _i1.PageRouteInfo {
  const ResetPasswordPageRoute() : super(name, path: '/reset-password-page');

  static const String name = 'ResetPasswordPageRoute';
}

class SplashScreenRoute extends _i1.PageRouteInfo {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}
