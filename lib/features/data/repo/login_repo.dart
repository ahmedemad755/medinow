import 'package:medinow/core/networking/api_handiler.dart';
import 'package:medinow/core/networking/api_resultes.dart';
import 'package:medinow/core/networking/api_service.dart';
import 'package:medinow/features/login/model/login_requist_body.dart';
import 'package:medinow/features/login/model/login_respons.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResultes<LoginRespons>> login(
    LoginRequistBody loginRequistBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequistBody);
      return Success(response); //  استخدام Success مباشرة
    } catch (error) {
      return Failure(ErrorHandler.handle(error)); //  استخدام Failure مباشرة
    }
  }
}
