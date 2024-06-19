class CreateNewOrderParams {
  final String eventId;

  CreateNewOrderParams({required this.eventId});

  Map<String, dynamic> toJson() => {
        "p_event_id": eventId,
      };
}
