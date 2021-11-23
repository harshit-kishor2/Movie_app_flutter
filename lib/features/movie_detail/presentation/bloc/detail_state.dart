import 'package:equatable/equatable.dart';
import 'package:movie_app/features/movie_detail/domain/entities/detail.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitialState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadSuccessState extends DetailState {
  final DetailEntity detail;

  const DetailLoadSuccessState({required this.detail});

  @override
  List<Object> get props => [];
}

class DetailLoadFailedState extends DetailState {}
