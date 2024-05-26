import 'dart:io';
import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources_provider.dart';
import 'package:history_hub/src/core/data/models/params/create_post_params.dart';
import 'package:history_hub/src/features/post/presentation/providers/create_post_status_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_post_controller.g.dart';

class CreatePostState {
  final String? content;
  final List<String>? listTagId;
  final File? image;

  CreatePostState({
    this.content,
    this.listTagId,
    this.image,
  });

  CreatePostState copyWith({
    String? content,
    List<String>? listTagId,
    File? image,
  }) {
    return CreatePostState(
      content: content ?? this.content,
      listTagId: listTagId ?? this.listTagId,
      image: image ?? this.image,
    );
  }
}

@riverpod
class CreatePostController extends _$CreatePostController {
  @override
  CreatePostState build() {
    return CreatePostState();
  }

  void setContent(String content) {
    state = state.copyWith(content: content);
  }

  void setImage(File image) {
    state = state.copyWith(image: image);
  }

  void removeImage() {
    state = CreatePostState(
      content: state.content,
      listTagId: state.listTagId,
    );
  }

  Future<void> createPost(String userId) async {
    ref.read(createPostStatusProvider.notifier).setLoading();
    final datasource = ref.read(appRemoteDatasourcesProvider);

    final (err, _) = await datasource.createPost(
      CreatePostParams(
        userId: userId,
        content: state.content ?? "",
        listTagId: state.listTagId ?? [],
        image: state.image,
      ),
    );

    if (err != null) {
      ref.read(createPostStatusProvider.notifier).setError(err);
      throw Exception(err.message);
    } else {
      ref.read(createPostStatusProvider.notifier).setSuccess();
    }
  }
}
