class AppUser {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final String avatarUrl;

  AppUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.avatarUrl,
  });

  // from json
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['user_id'],
      fullName: json['full_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      avatarUrl: json['avatar_url'],
    );
  }
}
