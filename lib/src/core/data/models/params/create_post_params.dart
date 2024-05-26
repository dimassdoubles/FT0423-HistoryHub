import 'dart:io';

class CreatePostParams {
  final String userId;
  final String content;
  final List<String> listTagId;
  final File? image;

  CreatePostParams({
    required this.userId,
    required this.content,
    required this.listTagId,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'content': content,
      'list_tag_id': listTagId,
    };
  }
}
