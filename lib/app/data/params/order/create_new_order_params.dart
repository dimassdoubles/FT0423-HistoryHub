class CreateNewOrderParams {
  final String eventId;
  final int price;

  CreateNewOrderParams({required this.eventId, required this.price});

  Map<String, dynamic> toJson() => {
        "in_event_id": eventId,
        "in_total_amount": price,
      };
}
