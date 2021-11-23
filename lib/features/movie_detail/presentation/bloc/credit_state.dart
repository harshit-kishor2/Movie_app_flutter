import 'package:equatable/equatable.dart';
import 'package:movie_app/features/movie_detail/domain/entities/credits.dart';

abstract class CreditState extends Equatable {
  const CreditState();

  @override
  List<Object> get props => [];
}

class CreditInitialState extends CreditState {}

class CreditLoadingState extends CreditState {}

class CreditsLoadSuccessState extends CreditState {
  final CreditsEntity credits;

  const CreditsLoadSuccessState({required this.credits});

  @override
  List<Object> get props => [];
}

class CreditLoadFailedState extends CreditState {}
