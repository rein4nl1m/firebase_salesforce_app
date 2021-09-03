import 'package:dartz/dartz.dart';
import '../../core/eithers/success/success.dart';
import '../../data/models/user_model.dart';
import '../../core/eithers/failure/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> currentUserProfile();

  Future<Either<Failure, Success>> createUserProfile({
    required String name,
    String? lastName,
    required String email,
    required String uid,
  });
}
