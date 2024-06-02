class CommentModel {
  final String id;
  final String postId;
  final String userId;
  final DateTime createdAt;
  final String content;

  const CommentModel({
    required this.id,
    required this.postId,
    required this.userId,
    required this.createdAt,
    required this.content,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      postId: json['post_id'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']).toLocal(),
      content: json['content'],
    );
  }

  CommentModel copyWith({
    String? id,
    String? postId,
    String? userId,
    DateTime? createdAt,
    String? content,
  }) {
    return CommentModel(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      content: content ?? this.content,
    );
  }
}
