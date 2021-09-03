// import 'package:firebase_salesforce_app/core/analytics/analytics_service.dart';
// import 'package:firebase_salesforce_app/core/di/injectable.dart';
import 'package:firebase_salesforce_app/core/routes/auth_guard.dart';
import 'package:firebase_salesforce_app/core/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter(authGuard: AuthGuard());
  // final _analytics = getIt<AnalyticsService>();

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Salesforce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // navigatorObservers: [
        //   _analytics.analyticsObserver,
        // ],
        routeInformationParser: _appRouter.defaultRouteParser(
          includePrefixMatches: true,
        ),
        routerDelegate: _appRouter.delegate(),
      ),
    );
  }
}
