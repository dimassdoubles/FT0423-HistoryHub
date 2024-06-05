import 'package:flutter_image_compress/flutter_image_compress.dart';

class EditUserProfileParams {
  final XFile? image;
  final String userId;
  final String name;
  final String telepon;
  final int kelurahanId;

  EditUserProfileParams({
    required this.image,
    required this.name,
    required this.telepon,
    required this.kelurahanId,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'p_user_id': userId,
      'p_name': name,
      'p_telepon': telepon,
      'p_kelurahan_id': kelurahanId,
    };
  }
}
