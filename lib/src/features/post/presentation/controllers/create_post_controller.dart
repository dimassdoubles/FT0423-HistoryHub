import 'dart:io';
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

  void post() {}
}
