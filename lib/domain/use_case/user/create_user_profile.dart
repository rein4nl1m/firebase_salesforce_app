import 'package:dartz/dartz.dart';
import '../../../core/eithers/success/success.dart';
import '../../../domain/repositories/user_repository.dart';
import '../../../core/eithers/failure/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateUserProfile {
  final UserRepository userRepository;

  CreateUserProfile({required this.userRepository});

  Future<Either<Failure, Success>> call({
    required String name,
    String? lastName,
    required String email,
    required String uid,
  }) {
    return userRepository.createUserProfile(
      name: name,
      email: email,
      uid: uid,
    );
  }
}
