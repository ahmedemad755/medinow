import '../../../core/networking/api_handiler.dart';
import '../../../core/networking/api_resultes.dart';
import '../../../core/networking/api_service.dart';
import '../../login/model/login_requist_body.dart';
import '../../login/model/login_respons.dart';

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
