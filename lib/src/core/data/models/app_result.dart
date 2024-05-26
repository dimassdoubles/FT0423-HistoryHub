import 'package:history_hub/src/core/error/app_failure.dart';

enum ResultStatus { initial, loading, success, error }

class AppResult<T> {
  final ResultStatus status;
  final T? data;
  final AppFailure? error;

  AppResult({required this.status, this.data, this.error});

  factory AppResult.initial({T? data}) {
    return AppResult<T>(status: ResultStatus.initial);
  }

  factory AppResult.loading() {
    return AppResult<T>(status: ResultStatus.loading);
  }

  factory AppResult.success(T data) {
    return AppResult<T>(status: ResultStatus.success, data: data);
  }

  factory AppResult.error(AppFailure error) {
    return AppResult<T>(status: ResultStatus.error, error: error);
  }
}
