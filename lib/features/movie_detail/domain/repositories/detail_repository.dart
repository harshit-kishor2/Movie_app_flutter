import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/features/movie_detail/domain/entities/credits.dart';
import 'package:movie_app/features/movie_detail/domain/entities/detail.dart';

abstract class DetailRepository {
  Future<Either<Failure, CreditsEntity>> getCastCrew(int id);
  Future<Either<Failure, DetailEntity>> getDetail(int id);
}
