import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String id;
  final String userId;
  final String namaUser;
  final String avatarUser;
  final DateTime tanggal;
  final List<String> listTagId;
  final String content;
  final String imageUrl;

  const PostModel({
    required this.userId,
    required this.id,
    required this.namaUser,
    required this.avatarUser,
    required this.tanggal,
    required this.listTagId,
    required this.content,
    required this.imageUrl,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['user_id'],
      namaUser: json['nama_user'],
      avatarUser: json['avatar_user'],
      tanggal: DateTime.parse(json['tanggal']),
      listTagId: List<String>.from(json['list_tag_id']),
      content: json['content'],
      imageUrl: json['image_url'],
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
      ];
}
