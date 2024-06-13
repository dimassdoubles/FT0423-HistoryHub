class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String alamatText;
  final int alamatId;
  final String avatarUrl;
  final bool isSuperAdmin;
  final bool isAdmin;
  final bool isCanPost;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.avatarUrl,
    required this.alamatText,
    required this.alamatId,
    required this.isAdmin,
    required this.isCanPost,
    required this.isSuperAdmin,
  });

  // from json
  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
      id: json['user_id'],
      fullName: json['full_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      alamatId: json['alamat_id'],
      alamatText: json['alamat_text'],
      isAdmin: json['is_admin'],
      isSuperAdmin: json['is_super_admin'],
      isCanPost: json['is_can_post'],
      avatarUrl: json['avatar_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': id,
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'alamat_text': alamatText,
      'alamat_id': alamatId,
      'is_super_admin': isSuperAdmin,
      'is_admin': isAdmin,
      'is_can_post': isCanPost,
      'avatar_url': avatarUrl,
    };
  }
}
