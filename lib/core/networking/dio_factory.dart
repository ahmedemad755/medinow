import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  //عملت اوبجيكت من الDIO علي شان اعرف استدعيها
  static Dio? dio;

  ///الداله اللي بتعمل انستنس من الDIO
  static Dio getdio() {
    Duration timeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      //الوقت اللي بتستغرقه البيانات قبل متوصل
      // والوقت اللي بتستغرقه البيانتات علي شان تتحمل
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      addDiointrospector();
      return dio!;
    } else {
      return dio!;
    }
  }

  //الداله اللي بتعرضلي  في الديبج كونسل اللي بيحصل
  //علي شان اعرف اشوف اشةف الاليرور فين ين
  static void addDiointrospector() {
    dio!.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }
}
