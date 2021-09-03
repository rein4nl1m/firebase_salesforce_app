// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  final _$registerUserAsyncAction =
      AsyncAction('_RegisterControllerBase.registerUser');

  @override
  Future<UserCredential> registerUser(
      {required String email, required String password}) {
    return _$registerUserAsyncAction
        .run(() => super.registerUser(email: email, password: password));
  }

  final _$sendEmailVerificationAsyncAction =
      AsyncAction('_RegisterControllerBase.sendEmailVerification');

  @override
  Future<void> sendEmailVerification() {
    return _$sendEmailVerificationAsyncAction
        .run(() => super.sendEmailVerification());
  }

  final _$createUserProfileAsyncAction =
      AsyncAction('_RegisterControllerBase.createUserProfile');

  @override
  Future<void> createUserProfile(
      {required String name,
      String? lastName,
      required String email,
      required String uid}) {
    return _$createUserProfileAsyncAction.run(() => super.createUserProfile(
        name: name, lastName: lastName, email: email, uid: uid));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
