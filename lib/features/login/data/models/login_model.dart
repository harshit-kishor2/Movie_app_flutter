import 'package:movie_app/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  //Cunstroctor
  const LoginModel({required String email, required String token})
      : super(email: email, token: token);

//get model from json
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        token: json["token"],
      );

//get json from model
  Map<String, dynamic> toJson() => {"email": email, "token": token};
}
