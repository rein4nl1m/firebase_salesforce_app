import 'package:dartz/dartz.dart';
import '../../../core/eithers/failure/failure.dart';
import '../../../core/eithers/success/success.dart';
import '../../repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyEmail {
  final AuthRepository authRepository;

  VerifyEmail({required this.authRepository});

  Future<Either<Failure, Success>> call() {
    return authRepository.emailVerification();
  }
}
