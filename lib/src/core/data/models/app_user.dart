class AppUser {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String namaKabupaten;
  final String namaKecamatan;
  final String namaKelurahan;
  final String avatarUrl;

  AppUser({
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
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
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
}
