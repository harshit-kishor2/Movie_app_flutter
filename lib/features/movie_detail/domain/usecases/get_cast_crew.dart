import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/core/base/usecase.dart';
import 'package:movie_app/features/movie_detail/domain/repositories/detail_repository.dart';
import 'package:movie_app/features/movie_detail/domain/entities/credits.dart';

class GetCastCrew implements UseCase<CreditsEntity, Params> {
  final DetailRepository detailRepository;

  GetCastCrew(this.detailRepository);

  @override
  Future<Either<Failure, CreditsEntity>> call(Params params) async {
    return await detailRepository.getCastCrew(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
