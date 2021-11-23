import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/models/result_model.dart';
import 'package:movie_app/features/home/domain/entities/movies_list_entity.dart';

class MoviesListModel extends MoviesListEntity {
  const MoviesListModel({
    @required results,
    @required page,
    @required totalResults,
    @required totalPages,
  }) : super(
            results: results,
            page: page,
            totalResults: totalResults,
            totalPages: totalPages);

  factory MoviesListModel.fromJson(Map<String, dynamic> json) =>
      MoviesListModel(
        results: List<ResultModel>.from(
            json["results"].map((x) => ResultModel.fromJson(x))),
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() {
    List<Map> _results = results.map((i) => i.toJson()).toList();
    return {
      "results": _results,
      "page": page,
      "total_results": totalResults,
      "total_pages": totalPages,
    };
  }
}
