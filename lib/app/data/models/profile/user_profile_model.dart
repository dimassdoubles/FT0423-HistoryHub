class UserProfileModel {
  final String userid;
  final String name;
  final String telepon;
  final int kelurahanId;
  final String alamatText;

  const UserProfileModel({
    required this.userid,
    required this.name,
    required this.telepon,
    required this.kelurahanId,
    required this.alamatText,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      userid: json['user_id'] as String,
      name: json['name'] as String,
      telepon: json['telepon'] as String,
      kelurahanId: json['kelurahan_id'] as int,
      alamatText: json['alamat_text'] as String,
    );
  }
}
