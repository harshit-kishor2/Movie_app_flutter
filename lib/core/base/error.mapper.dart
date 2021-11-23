import 'package:movie_app/core/constant/constant.dart';

class ErrorMapper {
  static const httpCodeUnauthorized = 401;
  static const httpCodeNotFound = 404;
  static const httpLocalDbNotFound = 1404;

  static String getErrorMessage(int statusCode) {
    switch (statusCode) {
      case httpCodeNotFound:
        return StringConst.noDataFound;
      case httpCodeUnauthorized:
        return StringConst.wrongCredentials;
      case httpLocalDbNotFound:
        return StringConst.noDataFoundLocalDB;
      default:
        return "${StringConst.somethingWrong} [$statusCode]";
    }
  }
}
