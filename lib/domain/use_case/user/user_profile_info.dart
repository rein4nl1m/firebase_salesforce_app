import 'package:dartz/dartz.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/repositories/user_repository.dart';
import '../../../core/eithers/failure/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserProfileInfo {
  final UserRepository userRepository;

  UserProfileInfo({required this.userRepository});

  Future<Either<Failure, UserModel>> call() {
    return userRepository.currentUserProfile();
  }
}
