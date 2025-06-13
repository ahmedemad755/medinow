import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medinow/features/home/data/apis/home_api_service.dart';
import 'package:medinow/features/home/data/repos/home_repo.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
import '../../features/data/repo/login_repo.dart';
import '../../features/data/repo/signup_repo.dart';
import '../../features/logic/login/login_cubit.dart';
import '../../features/logic/signUp/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getdio();
  getIt.registerLazySingleton<Dio>(() => DioFactory.getdio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
