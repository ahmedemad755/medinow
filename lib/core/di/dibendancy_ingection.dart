import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medinow/core/networking/api_service.dart';
import 'package:medinow/core/networking/dio_factory.dart';
import 'package:medinow/features/data/repo/login_repo.dart';
import 'package:medinow/features/data/repo/signup_repo.dart';
import 'package:medinow/features/logic/login/login_cubit.dart';
import 'package:medinow/features/logic/signUp/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  getIt.registerLazySingleton<Dio>(() => DioFactory.getdio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
