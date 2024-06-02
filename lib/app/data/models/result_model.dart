enum ResultStatus { initial, loading, success, error }

class ResultModel<T> {
  final ResultStatus status;
  final T? data;
  final Exception? error;

  ResultModel({required this.status, this.data, this.error});

  factory ResultModel.initial({T? data}) {
    return ResultModel<T>(status: ResultStatus.initial);
  }

  factory ResultModel.loading() {
    return ResultModel<T>(status: ResultStatus.loading);
  }

  factory ResultModel.success(T data) {
    return ResultModel<T>(status: ResultStatus.success, data: data);
  }

  factory ResultModel.error(Exception error) {
    return ResultModel<T>(status: ResultStatus.error, error: error);
  }
}
