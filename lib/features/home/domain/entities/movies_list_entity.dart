import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/models/result_model.dart';

class MoviesListEntity extends Equatable {
  const MoviesListEntity({
    required this.results,
    required this.page,
    required this.totalResults,
    required this.totalPages,
  });

  final List<ResultModel> results;
  final int page;
  final int totalResults;
  final int totalPages;

  @override
  List<Object> get props => [results, page, totalResults, totalPages];
}
