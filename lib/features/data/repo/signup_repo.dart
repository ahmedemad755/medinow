import 'package:medinow/core/networking/api_handiler.dart';
import 'package:medinow/core/networking/api_resultes.dart';
import 'package:medinow/core/networking/api_service.dart';
import 'package:medinow/features/sign_up/model/signup_requist_body.dart';
import 'package:medinow/features/sign_up/model/signup_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResultes<SignupResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return Success<SignupResponse>(response);
    } catch (error) {
      final handler = ErrorHandler.handle(error);
      return Failure<SignupResponse>(handler);
    }
  }
}
