import 'package:auto_route/auto_route.dart';
import 'package:firebase_salesforce_app/core/di/injectable.dart';
import 'package:firebase_salesforce_app/core/notifications/app_notifications.dart';
import 'package:firebase_salesforce_app/core/routes/auth_guard.dart';
import 'package:firebase_salesforce_app/core/routes/router.gr.dart';
import 'package:firebase_salesforce_app/presentation/pages/auth/login/controller/login_controller.dart';
import 'package:firebase_salesforce_app/presentation/widgets/padding_text_form_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../utils/responsive_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function(bool isLoggedIn)? onLoginResult;

  const LoginPage({Key? key, this.onLoginResult}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final LoginController _loginController = getIt<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: ResponsiveWidget.isMobile(context)
              ? const EdgeInsets.all(10.0)
              : const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Salesforce App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              PaddingTextFormField(
                controller: _emailController,
                label: 'Email',
                inputType: TextInputType.emailAddress,
                action: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Necessário informar um email';
                  }
                },
              ),
              Observer(
                builder: (context) {
                  return PaddingTextFormField(
                    controller: _passwordController,
                    label: 'Senha',
                    isObscure: _loginController.obscurePassword,
                    suffix: Observer(builder: (context) {
                      return IconButton(
                        onPressed: _loginController.setObscure,
                        icon: Icon(_loginController.visibilityPassword),
                      );
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Necessário informar a senha';
                      }
                    },
                  );
                },
              ),
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: ResponsiveWidget.isMobile(context) ? 14 : 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Esqueceu a senha?'),
                    TextButton(
                      onPressed: () => AppRouter(authGuard: AuthGuard()),
                      child: const Text('Resetar'),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Novo por aqui?'),
                  TextButton(
                    onPressed: () =>
                        context.router.push(const RegisterPageRoute()),
                    child: const Text('Cadastrar'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      if (_formKey.currentState!.validate()) {
        await _loginController.login(
          email: _emailController.text,
          password: _passwordController.text,
        );

        widget.onLoginResult?.call(true);
        context.router.replace(const HomePageRoute());
      }
    } catch (e) {
      AppNotifications.showToastError(
        'Erro ao realizar login: ${e.toString()}',
      );
    }
  }
}
