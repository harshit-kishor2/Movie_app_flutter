import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/core/constant/constant.dart';
import 'package:movie_app/features/home/data/models/movies_list_model.dart';
import 'package:movie_app/features/home/data/models/upcoming_movies_model.dart';
import 'package:movie_app/features/home/domain/entities/movies_list_entity.dart';
import 'package:movie_app/features/home/domain/entities/upcoming_movie_entity.dart';

abstract class MoviesRemoteDataSource {
  Future<MoviesListEntity> getAllNewShowing(int page);
  Future<UpcomingMoviesEntity> getAllSoon(int page);
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final http.Client client;

  MoviesRemoteDataSourceImpl({required this.client});

  @override
  Future<MoviesListEntity> getAllNewShowing(int page) => _getNewShowingFromUrl(
      Uri.https(
          ApiConstant.movieUrl, ApiConstant.popularPath, {'page': '$page'}),
      {'Authorization': ApiConstant.tokenKey});

  Future<MoviesListModel> _getNewShowingFromUrl(
      Uri url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return MoviesListModel.fromJson(decodedJson);
    } else {
      throw const BaseException(code: 500, message: 'Some Exception');
    }
  }

  @override
  Future<UpcomingMoviesEntity> getAllSoon(int page) => _getSoonFromUrl(
      Uri.https(
          ApiConstant.movieUrl, ApiConstant.upcomingPath, {'page': '$page'}),
      {'Authorization': ApiConstant.tokenKey});

  Future<UpcomingMoviesModel> _getSoonFromUrl(
      Uri url, Map<String, String> headers) async {
    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return UpcomingMoviesModel.fromJson(decodedJson);
    } else {
      throw const BaseException(code: 500, message: 'Some Exception');
    }
  }
}
