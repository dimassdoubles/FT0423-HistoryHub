class OrderModel {
  String id;
  String userId;
  int totalAmount;
  int statusId;
  String token;
  String redirectUrl;
  DateTime createdAt;
  DateTime updatedAt;

  OrderModel({
    required this.id,
    required this.userId,
    required this.totalAmount,
    required this.statusId,
    required this.token,
    required this.redirectUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['order_id'],
      userId: json['user_id'],
      totalAmount: json['total_amount'],
      statusId: json['status_id'],
      token: json['token'],
      redirectUrl: json['redirect_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
