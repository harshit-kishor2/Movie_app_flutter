import 'package:equatable/equatable.dart';
import 'package:movie_app/features/movie_detail/domain/entities/cast.dart';
import 'package:movie_app/features/movie_detail/domain/entities/crew.dart';

class CreditsEntity extends Equatable {
  const CreditsEntity({
    required this.id,
    required this.cast,
    required this.crew,
  });

  final int id;
  final List<CastEntity> cast;
  final List<CrewEntity> crew;

  @override
  List<Object> get props => [id, cast, crew];
}
