import 'api_handiler.dart';

/// القاعدة العامة لنتائج الـ API
abstract class ApiResultes<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(ErrorHandler errorHandler) failure,
  });
}

/// حالة النجاح
class Success<T> extends ApiResultes<T> {
  final T data;

  Success(this.data);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(ErrorHandler errorHandler) failure,
  }) {
    return success(data);
  }
}

/// حالة الفشل
class Failure<T> extends ApiResultes<T> {
  final ErrorHandler errorHandler;

  Failure(this.errorHandler);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(ErrorHandler errorHandler) failure,
  }) {
    return failure(errorHandler);
  }
}
