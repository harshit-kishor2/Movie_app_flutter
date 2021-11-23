import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_detail/domain/entities/spoken_language.dart';

class SpokenLanguageModel extends SpokenLanguageEntity {
  const SpokenLanguageModel({
    @required englishName,
    @required iso6391,
    @required name,
  }) : super(
          englishName: englishName,
          iso6391: iso6391,
          name: name,
        );

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      SpokenLanguageModel(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
