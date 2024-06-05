class UserProfileModel {
  final String userid;
  final String name;
  final String telepon;
  final String email;
  final int kelurahanId;
  final String avatarUrl;
  final String alamatText;

  const UserProfileModel({
    required this.userid,
    required this.name,
    required this.telepon,
    required this.kelurahanId,
    required this.alamatText,
    required this.email,
    required this.avatarUrl,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      userid: json['user_id'] as String,
      avatarUrl: json['avatar_url'] as String,
      name: json['full_name'] as String,
      telepon: json['phone_number'] as String,
      email: json['email'] as String,
      kelurahanId: json['kelurahan_id'] as int,
      alamatText:
          '${json['nama_kabupaten']}, ${json['nama_kecamatan']}, ${json['nama_kelurahan']}',
    );
  }
}
