import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {}

class AuthFailure extends Failure {
  FirebaseAuthException? exception;
  bool? emailVerified;

  AuthFailure({this.exception, this.emailVerified});

  @override
  String toString() {
    if (exception == null && emailVerified == null) return '';

    if (!emailVerified!) return 'Email não verificado';

    String message = '';

    switch (exception!.code) {
      case 'user-disabled':
        message = 'Usuário inativo!';
        break;
      case 'user-not-found':
        message = 'Usuário não encontrado!';
        break;
      case 'wrong-password':
        message = 'Senha incorreta!';
        break;
      default:
        message = exception?.message ?? '';
        break;
    }

    return message;
  }
}

class ServerFailure extends Failure {}
