import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/core/constant/constant.dart';
import 'package:movie_app/features/movie_detail/data/models/credits_model.dart';
import 'package:movie_app/features/movie_detail/data/models/detail_model.dart';
import 'package:movie_app/features/movie_detail/domain/entities/credits.dart';
import 'package:movie_app/features/movie_detail/domain/entities/detail.dart';

abstract class DetailRemoteDataSource {
  Future<CreditsEntity> getCastCrew(int id);
  Future<DetailEntity> getDetail(int id);
}

class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  final http.Client client;

  DetailRemoteDataSourceImpl({required this.client});

  @override
  Future<CreditsEntity> getCastCrew(int id) => _getCastCrew(
      Uri.https(ApiConstant.movieUrl, '/3/movie/$id/credits'),
      {'Authorization': ApiConstant.tokenKey});

  Future<CreditsModel> _getCastCrew(
      Uri url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return CreditsModel.fromJson(decodedJson);
    } else {
      throw const BaseException(code: 500, message: 'Some Exception');
    }
  }

  @override
  Future<DetailEntity> getDetail(int id) => _getDetail(
      Uri.https(ApiConstant.movieUrl, '/3/movie/$id'),
      {'Authorization': ApiConstant.tokenKey});

  Future<DetailModel> _getDetail(Uri url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return DetailModel.fromJson(decodedJson);
    } else {
      throw const BaseException(code: 500, message: 'Some Exception');
    }
  }
}
