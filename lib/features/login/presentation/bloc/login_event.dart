import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Event when login button pressed
class LoginButtonPressed implements LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed(this.email, this.password);
  @override
  List<Object> get props => [email, password];

  @override
  bool? get stringify => throw UnimplementedError();
}
