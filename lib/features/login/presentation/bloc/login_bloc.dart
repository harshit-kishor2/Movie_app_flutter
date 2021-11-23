// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/core/util/shared_preference.dart';
import 'package:movie_app/features/login/domain/entities/login_entity.dart';
import 'package:movie_app/features/login/domain/usecases/login_usecase.dart';

import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUseCase;
  final SharedPreferenceModule sharedPreferenceModule;

  LoginBloc({required this.loginUseCase, required this.sharedPreferenceModule})
      : super(Idle());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield Loading();
      final loginFailedOrSuccess = await loginUseCase(Params(
        email: event.email,
        password: event.password,
      ));
      yield* _eitherLoadedOrErrorState(loginFailedOrSuccess);
    }
  }

  Stream<LoginState> _eitherLoadedOrErrorState(
    Either<Failure, LoginEntity> loginFailedOrSuccess,
  ) async* {
    yield loginFailedOrSuccess.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (success) {
        sharedPreferenceModule.saveUserData(jsonEncode(success));
        return Loaded(loginEntity: success);
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case BaseException:
        return failure.message1;
      case BaseFailure:
        return failure.message1;
      default:
        return 'Unexpected error';
    }
  }
}
