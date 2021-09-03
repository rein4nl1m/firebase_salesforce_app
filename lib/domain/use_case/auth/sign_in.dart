import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/eithers/failure/failure.dart';
import '../../repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignIn {
  final AuthRepository authRepository;

  SignIn({required this.authRepository});

  Future<Either<Failure, UserCredential>> call({
    required String email,
    required String password,
  }) {
    return authRepository.signIn(
      email: email,
      password: password,
    );
  }
}
