import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/features/home/data/datasources/movies_remote_datasource.dart';
import 'package:movie_app/features/home/domain/entities/movies_list_entity.dart';
import 'package:movie_app/features/home/domain/entities/upcoming_movie_entity.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDatasource;

  MoviesRepositoryImpl({
    required this.moviesRemoteDatasource,
  });

  @override
  Future<Either<Failure, MoviesListEntity>> getAllNewShowing(int page) async {
    try {
      return Right(await moviesRemoteDatasource.getAllNewShowing(page));
    } on BaseException catch (e) {
      return Left(BaseException(code: 500, message: e.message));
    }
  }

  @override
  Future<Either<Failure, UpcomingMoviesEntity>> getAllSoon(int page) async {
    try {
      return Right(await moviesRemoteDatasource.getAllSoon(page));
    } on BaseException catch (e) {
      return Left(BaseException(code: 500, message: e.message));
    }
  }
}
