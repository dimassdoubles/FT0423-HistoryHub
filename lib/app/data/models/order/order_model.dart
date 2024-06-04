class OrderModel {
  String id;
  String userId;
  String eventId;
  String eventNama;
  String statusNama;
  int totalAmount;
  String token;
  DateTime createdAt;
  DateTime updatedAt;

  OrderModel({
    required this.eventId,
    required this.eventNama,
    required this.statusNama,
    required this.id,
    required this.userId,
    required this.totalAmount,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      eventId: json['event_id'],
      eventNama: json['event_nama'],
      statusNama: json['status_name'],
      id: json['order_id'],
      userId: json['user_id'],
      totalAmount: json['total_amount'],
      token: json['token'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
