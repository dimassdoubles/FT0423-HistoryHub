import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources_provider.dart';
import 'package:history_hub/src/core/data/models/params/get_post_params.dart';
import 'package:history_hub/src/core/data/models/post_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_post_provider.g.dart';

@riverpod
class ListPost extends _$ListPost {
  @override
  Future<List<PostModel>> build() async {
    return [];
  }

  void getPost(GetPostParams params) async {
    try {
      // state = const AsyncValue.loading();
      final datasource = ref.read(appRemoteDatasourcesProvider);
      final result = await datasource.getPost(params);
      state = AsyncValue.data(result);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  void like() {}
}
