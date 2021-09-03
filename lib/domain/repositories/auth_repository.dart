import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/eithers/failure/failure.dart';
import '../../core/eithers/success/success.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, Success>> signOut();

  Future<Either<Failure, UserCredential>> registerUser({
    required String email,
    required String password,
  });

  Future<Either<Failure, Success>> emailVerification();
}
