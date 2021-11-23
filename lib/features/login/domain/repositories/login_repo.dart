import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/features/login/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> getLoginUser(
    String email,
    String password,
  );
}
