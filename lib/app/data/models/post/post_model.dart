import 'package:equatable/equatable.dart';
import 'package:history_hub_v2/app/core/constants/base_url.dart';

class PostModel extends Equatable {
  final String id;
  final String userId;
  final String namaUser;
  final String avatarUser;
  final DateTime tanggal;
  final List<String> listTagId;
  final String content;
  final String imageUrl;
  final int likeCount;
  final int commentCount;
  final bool isLikedByMe;

  const PostModel({
    required this.isLikedByMe,
    required this.userId,
    required this.id,
    required this.namaUser,
    required this.avatarUser,
    required this.tanggal,
    required this.listTagId,
    required this.content,
    required this.imageUrl,
    required this.likeCount,
    required this.commentCount,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    String imageUrl = json['image_url'];
    if (imageUrl.isNotEmpty) {
      imageUrl = '$baseUrl/storage/v1/object/public/$imageUrl';
    }

    return PostModel(
      id: json['id'],
      userId: json['user_id'],
      namaUser: json['nama_user'],
      avatarUser: json['avatar_user'],
      tanggal: DateTime.parse(json['tanggal']).toLocal(),
      listTagId: List<String>.from(json['list_tag_id']),
      content: json['content'],
      imageUrl: imageUrl,
      likeCount: json['like_count'],
      commentCount: json['comment_count'],
      isLikedByMe: json['is_liked_by_me'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        namaUser,
        avatarUser,
        tanggal,
        listTagId,
        content,
        imageUrl,
        likeCount,
        commentCount,
        isLikedByMe,
      ];
}
