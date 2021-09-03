// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<IconData>? _$visibilityPasswordComputed;

  @override
  IconData get visibilityPassword => (_$visibilityPasswordComputed ??=
          Computed<IconData>(() => super.visibilityPassword,
              name: '_LoginControllerBase.visibilityPassword'))
      .value;

  final _$obscurePasswordAtom =
      Atom(name: '_LoginControllerBase.obscurePassword');

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future<String> login({required String email, required String password}) {
    return _$loginAsyncAction
        .run(() => super.login(email: email, password: password));
  }

  final _$loggoutAsyncAction = AsyncAction('_LoginControllerBase.loggout');

  @override
  Future<void> loggout() {
    return _$loggoutAsyncAction.run(() => super.loggout());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void setObscure() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setObscure');
    try {
      return super.setObscure();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscurePassword: ${obscurePassword},
visibilityPassword: ${visibilityPassword}
    ''';
  }
}
