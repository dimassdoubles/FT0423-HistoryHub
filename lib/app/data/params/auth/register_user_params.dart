class RegisterUserParams {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final int kabupatenId;
  final int kecamatanId;
  final int kelurahanId;

  RegisterUserParams({
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.kabupatenId,
    required this.kecamatanId,
    required this.kelurahanId,
  });

  Map<String, dynamic> toMap() => {
        'full_name': fullName,
        'email': email,
        'phone_number': phoneNumber,
        'id_kelurahan': kelurahanId,
        'avatar_url': '',
      };
}
