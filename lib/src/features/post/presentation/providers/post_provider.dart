import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources_provider.dart';
import 'package:history_hub/src/core/data/models/params/create_post_params.dart';
import 'package:history_hub/src/core/data/models/params/get_post_params.dart';
import 'package:history_hub/src/core/data/models/post_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_provider.g.dart';

@riverpod
class Post extends _$Post {
  @override
  List<PostModel> build() {
    return [];
  }

  void getPost(GetPostParams params) {
    
  }

  void createPost(CreatePostParams params) {
    ref.read(appRemoteDatasourcesProvider).createPost(params);
  }
}
