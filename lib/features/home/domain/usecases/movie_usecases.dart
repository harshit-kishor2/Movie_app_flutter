import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/core/base/usecase.dart';
import 'package:movie_app/features/home/domain/entities/movies_list_entity.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repository.dart';

class MoviesUseCases implements UseCase<MoviesListEntity, int> {
  final MoviesRepository moviesRepository;

  MoviesUseCases({required this.moviesRepository});

  @override
  Future<Either<Failure, MoviesListEntity>> call(int page) async {
    return await moviesRepository.getAllNewShowing(page);
  }
}
