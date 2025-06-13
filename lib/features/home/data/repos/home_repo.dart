import 'package:medinow/core/networking/api_handiler.dart';
import 'package:medinow/core/networking/api_resultes.dart';
import 'package:medinow/features/home/data/apis/home_api_service.dart';
import 'package:medinow/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResultes<SpecializationsResponseModel>> getSpecialization() async {
    try {
      final response = await _homeApiService.getSpecialization();
      return Success(response);
    } catch (error) {
      return Failure(ErrorHandler.handle(error));
    }
  }
}
