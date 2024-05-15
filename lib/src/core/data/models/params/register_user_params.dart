class RegisterUserParams {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String address;

  RegisterUserParams({
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.email,
  });
}
