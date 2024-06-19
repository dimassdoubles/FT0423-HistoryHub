import 'package:flutter/material.dart';
import 'package:history_hub_v2/app/data/models/event/event_participant_model.dart';

class ListParticipant extends StatelessWidget {
  final List<EventParticipantModel> data;
  const ListParticipant(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Text(data[index].name),
    );
  }
}
