import 'package:auto_route/auto_route.dart';
import 'package:firebase_salesforce_app/core/di/injectable.dart';
import 'package:firebase_salesforce_app/core/notifications/app_notifications.dart';
import 'package:firebase_salesforce_app/core/routes/router.gr.dart';
import 'package:firebase_salesforce_app/presentation/pages/auth/login/controller/login_controller.dart';
import 'package:firebase_salesforce_app/presentation/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LoginController _loginController = getIt<LoginController>();
  final HomeController _homeController = getIt<HomeController>();

  @override
  void initState() {
    _homeController.currentUserProfileInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Observer(
              builder: (context) {
                var profile = _homeController.userProfile;
                return UserAccountsDrawerHeader(
                  accountName: Text(profile?.name ?? ''),
                  accountEmail: Text(profile?.email ?? ''),
                );
              },
            ),
            TextButton(
              child: const Text('Sair'),
              onPressed: () => _sair(context),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Clientes'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Produtos'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Pedidos'),
            ),
          ],
        ),
      ),
    );
  }

  _sair(BuildContext context) async {
    try {
      await _loginController.loggout();
      context.router.replace(const LoginPageRoute());
    } catch (e) {
      AppNotifications.showToastError(
        'Erro ao realizar logoff: ${e.toString()}',
      );
    }
  }
}
