import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_detail/domain/entities/production_company.dart';

class ProductionCompanyModel extends ProductionCompanyEntity {
  const ProductionCompanyModel({
    @required id,
    @required logoPath,
    @required name,
    @required originCountry,
  }) : super(
            id: id,
            logoPath: logoPath,
            name: name,
            originCountry: originCountry);

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      ProductionCompanyModel(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}
