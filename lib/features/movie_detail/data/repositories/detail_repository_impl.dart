import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/features/movie_detail/data/datasources/detail_remote_data_source.dart';
import 'package:movie_app/features/movie_detail/domain/entities/credits.dart';
import 'package:movie_app/features/movie_detail/domain/entities/detail.dart';
import 'package:movie_app/features/movie_detail/domain/repositories/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDataSource detailRemoteDatasource;

  DetailRepositoryImpl({
    required this.detailRemoteDatasource,
  });

  @override
  Future<Either<Failure, CreditsEntity>> getCastCrew(int id) async {
    try {
      return Right(await detailRemoteDatasource.getCastCrew(id));
    } on BaseException catch (e) {
      return Left(BaseException(code: 500, message: e.message));
    }
  }

  @override
  Future<Either<Failure, DetailEntity>> getDetail(int id) async {
    try {
      return Right(await detailRemoteDatasource.getDetail(id));
    } on BaseException catch (e) {
      return Left(BaseException(code: 500, message: e.message));
    }
  }
}
