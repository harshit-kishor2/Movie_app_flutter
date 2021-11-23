import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/features/home/domain/entities/movies_list_entity.dart';
import 'package:movie_app/features/home/domain/entities/upcoming_movie_entity.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MoviesListEntity>> getAllNewShowing(int page);
  Future<Either<Failure, UpcomingMoviesEntity>> getAllSoon(int page);
}
