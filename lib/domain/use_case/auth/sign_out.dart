import 'package:dartz/dartz.dart';
import 'package:firebase_salesforce_app/core/eithers/failure/failure.dart';
import 'package:firebase_salesforce_app/core/eithers/success/success.dart';
import 'package:firebase_salesforce_app/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOut {
  final AuthRepository authRepository;

  SignOut({required this.authRepository});

  Future<Either<Failure, Success>> call() {
    return authRepository.signOut();
  }
}
