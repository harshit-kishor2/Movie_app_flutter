import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class MoviesInitialState extends HomeState {}

class MoviesLoadingState extends HomeState {}

class MoviesLoadSuccessState extends HomeState {
  final dynamic movies;

  const MoviesLoadSuccessState({this.movies});

  @override
  List<Object> get props => [];
}

class MoviesLoadFailedState extends HomeState {
  final String message;

  const MoviesLoadFailedState({required this.message});

  @override
  List<Object> get props => [message];
}
