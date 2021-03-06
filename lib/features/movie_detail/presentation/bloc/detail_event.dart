import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetDetailEvent extends DetailEvent {
  final int id;
  const GetDetailEvent({required this.id});

  @override
  List<Object> get props => [id];
}
