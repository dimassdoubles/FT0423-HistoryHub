import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/event/event_controller.dart';
import 'package:history_hub_v2/app/modules/event/widgets/event_list_item.dart';
import 'package:history_hub_v2/app/presentation/widgets/app_list_view.dart';

class EventListView extends GetView<EventController> {
  const EventListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppListView(
      key: controller.listKey,
      onRefresh: controller.onPageRefresh,
      pagingController: controller.pagingController,
      itemBuilder: (context, item, index) => EventListItem(item),
    );
  }
}
