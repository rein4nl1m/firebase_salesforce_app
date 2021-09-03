import 'package:firebase_salesforce_app/core/eithers/success/success.dart';
import 'package:firebase_salesforce_app/core/eithers/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_salesforce_app/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final _auth = FirebaseAuth.instance;
      final _userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!_userCredential.user!.emailVerified) {
        return left(AuthFailure(emailVerified: false));
      }

      return right(_userCredential);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure(exception: e));
    }
  }

  @override
  Future<Either<Failure, Success>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return right(VoidSuccess());
    } catch (e) {
      return left(AuthFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final _auth = FirebaseAuth.instance;
      final _userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(_userCredential);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure(exception: e));
    }
  }

  @override
  Future<Either<Failure, Success>> emailVerification() async {
    try {
      final _currentUser = FirebaseAuth.instance.currentUser;
      if (_currentUser != null && !_currentUser.emailVerified) {
        await _currentUser.sendEmailVerification();
      }
      return right(VoidSuccess());
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure(exception: e));
    }
  }
}
