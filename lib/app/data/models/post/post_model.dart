import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String id;
  final String userId;
  final String namaUser;
  final String avatarUser;
  final DateTime tanggal;
  final String content;
  final String imageUrl;
  final int likeCount;
  final int commentCount;
  final bool isLikedByMe;
  final bool isPinned;

  const PostModel({
    required this.isLikedByMe,
    required this.userId,
    required this.id,
    required this.namaUser,
    required this.avatarUser,
    required this.tanggal,
    required this.content,
    required this.imageUrl,
    required this.likeCount,
    required this.commentCount,
    this.isPinned = false,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['user_id'],
      namaUser: json['nama_user'],
      avatarUser: json['avatar_user'],
      tanggal: DateTime.parse(json['tanggal']).toLocal(),
      content: json['content'],
      imageUrl: json['image_url'],
      likeCount: json['like_count'],
      commentCount: json['comment_count'],
      isLikedByMe: json['is_liked_by_me'],
    );
  }

  PostModel copyWith({
    bool? isLikedByMe,
    String? userId,
    String? id,
    String? namaUser,
    String? avatarUser,
    DateTime? tanggal,
    List<String>? listTagId,
    String? content,
    String? imageUrl,
    int? likeCount,
    int? commentCount,
    bool? isPinned,
  }) {
    return PostModel(
      isLikedByMe: isLikedByMe ?? this.isLikedByMe,
      userId: userId ?? this.userId,
      id: id ?? this.id,
      namaUser: namaUser ?? this.namaUser,
      avatarUser: avatarUser ?? this.avatarUser,
      tanggal: tanggal ?? this.tanggal,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      isPinned: isPinned ?? this.isPinned,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        namaUser,
        avatarUser,
        tanggal,
        content,
        imageUrl,
        likeCount,
        commentCount,
        isLikedByMe,
      ];
}
