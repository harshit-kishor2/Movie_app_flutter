import 'package:equatable/equatable.dart';
import 'package:movie_app/features/login/domain/entities/login_entity.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

// Idle State
class Idle extends LoginState {}

// Loading State
class Loading extends LoginState {}

//Loaded State
class Loaded extends LoginState {
  final LoginEntity loginEntity;

  const Loaded({required this.loginEntity});

  @override
  List<Object> get props => [loginEntity];
}

// Error State
class Error extends LoginState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
