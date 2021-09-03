import '../../../../../domain/use_case/auth/sign_in.dart';
import '../../../../../domain/use_case/auth/sign_out.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'login_controller.g.dart';

@injectable
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final SignIn signInUseCase;
  final SignOut signOutUseCase;

  _LoginControllerBase({
    required this.signInUseCase,
    required this.signOutUseCase,
  });

  @observable
  bool obscurePassword = true;

  @action
  void setObscure() => obscurePassword = !obscurePassword;

  @computed
  IconData get visibilityPassword =>
      obscurePassword ? Icons.visibility : Icons.visibility_off;

  @action
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await signInUseCase(
        email: email,
        password: password,
      );

      return response.fold(
        (failure) => throw failure,
        (userCredential) => userCredential.user!.uid,
      );
    } catch (error) {
      rethrow;
    }
  }

  @action
  Future<void> loggout() async {
    try {
      await signOutUseCase();
    } catch (error) {
      rethrow;
    }
  }
}
