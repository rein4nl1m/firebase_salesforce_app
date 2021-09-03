import 'package:auto_route/auto_route.dart';
import 'package:firebase_salesforce_app/core/di/injectable.dart';
import 'package:firebase_salesforce_app/core/notifications/app_notifications.dart';
import 'package:firebase_salesforce_app/presentation/pages/auth/register/controller/register_controller.dart';
import 'package:firebase_salesforce_app/presentation/utils/responsive_widget.dart';
import 'package:firebase_salesforce_app/presentation/widgets/padding_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final RegisterController _registerController = getIt<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: ResponsiveWidget.isMobile(context)
                ? const EdgeInsets.all(10.0)
                : const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: PaddingTextFormField(
                        controller: _nameController,
                        label: 'Nome',
                        action: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Necessário informar um nome';
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: PaddingTextFormField(
                        controller: _lastNameController,
                        label: 'Sobrenome',
                        action: TextInputAction.next,
                      ),
                    ),
                  ],
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
                PaddingTextFormField(
                  controller: _passwordController,
                  label: 'Senha',
                  action: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Necessário informar a senha';
                    }
                  },
                ),
                PaddingTextFormField(
                  controller: _confirmPasswordController,
                  label: 'Confirmar Senha',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Necessário confirmar a senha';
                    }

                    if (value != _passwordController.text) {
                      return 'Confirmação de senha incorreta';
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => context.router.pop(),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          fontSize:
                              ResponsiveWidget.isMobile(context) ? 14 : 22,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => register(),
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize:
                              ResponsiveWidget.isMobile(context) ? 14 : 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      try {
        final _userCredential = await _registerController.registerUser(
          email: _emailController.text,
          password: _passwordController.text,
        );

        await _registerController.createUserProfile(
          name: _nameController.text,
          lastName: _lastNameController.text,
          email: _emailController.text,
          uid: _userCredential.user!.uid,
        );

        await _registerController.sendEmailVerification();

        context.router.pop();
      } catch (e) {
        AppNotifications.showToastError('Erro ao cadastrar usuário: $e');
      }
    }
  }
}
