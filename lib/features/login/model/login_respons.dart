import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_respons.g.dart';

//الكلاس اللي هتستقبل منه البيانات
//او الرد من السيرفر فبجهزله مودل يستقبل البيانات

@JsonSerializable()
class LoginRespons {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;

  LoginRespons({this.message, this.userData, this.status, this.code});
  factory LoginRespons.fromJson(Map<String, dynamic> json) =>
      _$LoginResponsFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  UserData({this.token, this.userName});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
