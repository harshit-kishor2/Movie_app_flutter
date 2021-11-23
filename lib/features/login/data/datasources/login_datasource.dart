import 'package:movie_app/core/base/base_failure.dart';
import 'package:movie_app/core/util/global_utility.dart';
import 'package:movie_app/features/login/data/models/login_model.dart';
import 'package:movie_app/features/login/domain/entities/login_entity.dart';

abstract class LoginDataSource {
  Future<LoginEntity> getLoginUser(String email, String password);
}

class LoginDataSourceImpl implements LoginDataSource {
  LoginDataSourceImpl();
  @override
  Future<LoginEntity> getLoginUser(String email, String password) async {
    // const response = 'await dio.post("auth/login", data: {email, password});';
    try {
      if (email == 'abc@123.com' && password == '123456') {
        var response = {'email': email, 'token': 'dhdhjjdj'};
        var r = LoginModel.fromJson(response);
        printWarning("LOG $r");
        return r;
      } else {
        throw const BaseFailure(message: "Wrong Email or Password.", code: 500);
      }
    } on Exception catch (e) {
      throw BaseException(message: "Exception : ${e.toString()}", code: 500);
    }
  }
}
