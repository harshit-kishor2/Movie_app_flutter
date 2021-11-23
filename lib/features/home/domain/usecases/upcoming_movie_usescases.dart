import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/core/base/usecase.dart';
import 'package:movie_app/features/home/domain/entities/upcoming_movie_entity.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repository.dart';

class UpcomingMoviesUseCases implements UseCase<UpcomingMoviesEntity, int> {
  final MoviesRepository moviesRepository;

  UpcomingMoviesUseCases({required this.moviesRepository});

  @override
  Future<Either<Failure, UpcomingMoviesEntity>> call(int page) async {
    return await moviesRepository.getAllSoon(page);
  }
}
