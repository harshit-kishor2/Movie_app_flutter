import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/models/dates_model.dart';
import 'package:movie_app/features/home/data/models/result_model.dart';

class UpcomingMoviesEntity extends Equatable {
  final List<ResultModel> results;
  final int page;
  final int totalResults;
  final DatesModel dates;
  final int totalPages;

  const UpcomingMoviesEntity({
    required this.results,
    required this.page,
    required this.totalResults,
    required this.dates,
    required this.totalPages,
  });

  @override
  List<Object> get props => [results, page, totalResults, dates, totalPages];
}
