class TransactionTokenModel {
  final String token;
  final String redirectUrl;

  TransactionTokenModel({
    required this.token,
    required this.redirectUrl,
  });

  factory TransactionTokenModel.fromJson(Map<String, dynamic> json) {
    return TransactionTokenModel(
      token: json["token"],
      redirectUrl: json["redirect_url"],
    );
  }
}
