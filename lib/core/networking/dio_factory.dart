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
      addDioHeaders();
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

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzQ5NzY4ODEyLCJleHAiOjE3NDk4NTUyMTIsIm5iZiI6MTc0OTc2ODgxMiwianRpIjoidG83elZGMWR3SzRzNERMTCIsInN1YiI6IjQwOTAiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.XhVstv1TEC1koFL4E08BwoYhDPGVnVsoN2VdvXPV0HA',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }
}
