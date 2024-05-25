import 'dart:io';

class CreatePostParams {
  final String content;
  final List<String> listTagId;
  final File? image;

  CreatePostParams({
    required this.content,
    required this.listTagId,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'list_tag_id': listTagId,
    };
  }
}
