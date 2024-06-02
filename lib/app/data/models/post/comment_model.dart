class CommentModel {
  final String id;
  final String postId;
  final String userId;
  final DateTime createdAt;
  final String content;
  final String userName;
  final String userAvatarUrl;

  const CommentModel({
    required this.id,
    required this.postId,
    required this.userId,
    required this.createdAt,
    required this.content,
    required this.userName,
    required this.userAvatarUrl,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      postId: json['post_id'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']).toLocal(),
      content: json['content'],
      userName: json['fullname'],
      userAvatarUrl: json['avatar_url'],
    );
  }
}
