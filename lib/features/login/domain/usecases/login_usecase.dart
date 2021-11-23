import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/core/base/usecase.dart';
import 'package:movie_app/features/login/domain/entities/login_entity.dart';
import 'package:movie_app/features/login/domain/repositories/login_repo.dart';

class LoginUsecase implements UseCase<LoginEntity, Params> {
  final LoginRepository loginRepository;

  LoginUsecase({required this.loginRepository});

  @override
  Future<Either<Failure, LoginEntity>> call(Params params) async {
    return await loginRepository.getLoginUser(params.email, params.password);
  }
}

//Parameter for function call
class Params extends Equatable {
  final String email;
  final String password;
  const Params({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}
