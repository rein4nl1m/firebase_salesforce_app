// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../presentation/pages/pages.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    LoginPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.LoginPage();
        }),
    RegisterPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.RegisterPage();
        }),
    ResetPasswordPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.ResetPasswordPage();
        }),
    SplashScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i1.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i1.RouteConfig(RegisterPageRoute.name, path: '/register-page'),
        _i1.RouteConfig(ResetPasswordPageRoute.name,
            path: '/reset-password-page'),
        _i1.RouteConfig(SplashScreenRoute.name, path: '/')
      ];
}

class HomePageRoute extends _i1.PageRouteInfo {
  const HomePageRoute() : super(name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

class LoginPageRoute extends _i1.PageRouteInfo {
  const LoginPageRoute() : super(name, path: '/login-page');

  static const String name = 'LoginPageRoute';
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
