class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String namaKabupaten;
  final String namaKecamatan;
  final String namaKelurahan;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.avatarUrl,
    required this.namaKabupaten,
    required this.namaKecamatan,
    required this.namaKelurahan,
  });

  // from json
  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
      id: json['user_id'],
      fullName: json['full_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      namaKabupaten: json['nama_kabupaten'],
      namaKecamatan: json['nama_kecamatan'],
      namaKelurahan: json['nama_kelurahan'],
      avatarUrl: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': id,
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'nama_kabupaten': namaKabupaten,
      'nama_kecamatan': namaKecamatan,
      'nama_kelurahan': namaKelurahan,
      'avatar_url': avatarUrl,
    };
  }
}
