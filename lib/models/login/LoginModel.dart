import 'package:json_annotation/json_annotation.dart';
part 'LoginModel.g.dart';

@JsonSerializable()
class LoginModel{
  final String username;
  final String password;

  LoginModel(this.username, this.password);

  factory LoginModel.fromJson(Map<String,dynamic> data) => _$LoginModelFromJson(data);

  Map<String,dynamic> toJson() => _$LoginModelToJson(this);
}