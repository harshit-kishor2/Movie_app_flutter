import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entities/dates_entity.dart';

class DatesModel extends DatesEntity {
  const DatesModel({
    @required maximum,
    @required minimum,
  }) : super(minimum: minimum, maximum: maximum);

  factory DatesModel.fromJson(Map<String, dynamic> json) => DatesModel(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}
