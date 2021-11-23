import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/core/base/usecase.dart';
import 'package:movie_app/features/movie_detail/domain/repositories/detail_repository.dart';
import 'package:movie_app/features/movie_detail/domain/entities/detail.dart';

class GetDetail implements UseCase<DetailEntity, Params> {
  final DetailRepository detailRepository;

  GetDetail(this.detailRepository);

  @override
  Future<Either<Failure, DetailEntity>> call(Params params) async {
    return await detailRepository.getDetail(params.id);
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
