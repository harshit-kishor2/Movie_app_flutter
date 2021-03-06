import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_detail/data/models/cast_model.dart';
import 'package:movie_app/features/movie_detail/data/models/crew_model.dart';
import 'package:movie_app/features/movie_detail/domain/entities/cast.dart';
import 'package:movie_app/features/movie_detail/domain/entities/credits.dart';
import 'package:movie_app/features/movie_detail/domain/entities/crew.dart';

class CreditsModel extends CreditsEntity {
  const CreditsModel({
    @required id,
    @required cast,
    @required crew,
  }) : super(
          id: id,
          cast: cast,
          crew: crew,
        );

  factory CreditsModel.fromJson(Map<String, dynamic> json) => CreditsModel(
        id: json["id"],
        cast: List<CastEntity>.from(
            json["cast"].map((x) => CastModel.fromJson(x))),
        crew: List<CrewEntity>.from(
            json["crew"].map((x) => CrewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x)),
        "crew": List<dynamic>.from(crew.map((x) => x)),
      };
}
