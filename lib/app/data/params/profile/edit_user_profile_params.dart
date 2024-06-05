import 'package:flutter_image_compress/flutter_image_compress.dart';

class EditUserProfileParams {
  final XFile? image;
  final String name;
  final String telepon;
  final int kelurahanId;

  EditUserProfileParams({
    required this.image,
    required this.name,
    required this.telepon,
    required this.kelurahanId,
  });

  Map<String, dynamic> toJson() {
    return {
      'p_name': name,
      'p_telepon': telepon,
      'p_kelurahan_id': kelurahanId,
    };
  }
}
