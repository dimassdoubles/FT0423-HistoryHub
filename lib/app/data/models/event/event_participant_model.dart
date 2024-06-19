class EventParticipantModel {
  final String orderId;
  final String eventId;
  final String userId;
  final String name;
  final String imageUrl;
  final int statusId;

  EventParticipantModel({
    required this.orderId,
    required this.eventId,
    required this.userId,
    required this.name,
    required this.imageUrl,
    required this.statusId,
  });

  factory EventParticipantModel.fromJson(Map<String, dynamic> json) {
    return EventParticipantModel(
      orderId: json['order_id'],
      eventId: json['event_id'],
      userId: json['user_id'],
      name: json['user_name'],
      imageUrl: json['user_avatar_url'],
      statusId: json['order_status_id'],
    );
  }
}
