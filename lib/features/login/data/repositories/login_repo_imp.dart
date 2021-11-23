import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/core/module/network_info.dart';
import 'package:movie_app/features/login/data/datasources/login_datasource.dart';
import 'package:movie_app/features/login/domain/entities/login_entity.dart';
import 'package:movie_app/features/login/domain/repositories/login_repo.dart';

class LoginRepositoryImpl implements LoginRepository {
  late final LoginDataSource loginDataSource;
  late final NetworkInfo networkInfo;
  LoginRepositoryImpl({
    required this.loginDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, LoginEntity>> getLoginUser(
      String email, String password) async {
    try {
      var loginUser = await loginDataSource.getLoginUser(email, password);
      return Right(loginUser);
    } on BaseFailure catch (e) {
      return Left(BaseFailure(message: e.message, code: 500));
    } on BaseException catch (e) {
      return Left(BaseException(message: e.message, code: 500));
    }
  }
}
