import 'dart:io';

class CreatePostParams {
  final String userId;
  final String content;
  final File? image;

  CreatePostParams({
    required this.userId,
    required this.content,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'p_content': content,
    };
  }
}
