import 'package:history_hub/src/core/data/models/app_result.dart';
import 'package:history_hub/src/core/error/app_failure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_post_status_provider.g.dart';

@riverpod
class CreatePostStatus extends _$CreatePostStatus {
  @override
  (AppFailure?, ResultStatus) build() {
    return (null, ResultStatus.initial);
  }

  void setLoading() {
    state = (null, ResultStatus.loading);
  }

  void setSuccess() {
    state = (null, ResultStatus.success);
  }

  void setError(AppFailure? failure) {
    state = (failure, ResultStatus.error);
  }
}
