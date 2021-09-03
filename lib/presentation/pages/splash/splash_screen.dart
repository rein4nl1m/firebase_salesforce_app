import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_salesforce_app/core/routes/router.gr.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startSplash() {
    const durationSplash = Duration(seconds: 5);
    return Timer(durationSplash, _homeNavigation);
  }

  void _homeNavigation() {
    context.router.replace(const LoginPageRoute());
  }

  @override
  void initState() {
    super.initState();
    _startSplash();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Firebase Salesforce App',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
