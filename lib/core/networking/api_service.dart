import 'package:dio/dio.dart';
import 'package:medinow/features/login/model/login_requist_body.dart';
import 'package:medinow/features/login/model/login_respons.dart';
import 'package:medinow/features/sign_up/model/signup_requist_body.dart';
import 'package:medinow/features/sign_up/model/signup_response.dart';
import 'package:retrofit/http.dart';

import 'package:medinow/core/networking/api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apibaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //ببعت الداتا للسيرفر علي شان يتاكد منها
  @POST(ApiConstants.login)
  Future<LoginRespons> login(@Body() LoginRequistBody loginRequistBody);

  @POST(ApiConstants.registerEndpoint)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
}
