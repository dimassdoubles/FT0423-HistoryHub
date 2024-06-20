import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/modules/event/list_participant/list_participant_controller.dart';
import 'package:history_hub_v2/app/modules/event/list_participant/widgets/list_participant_item.dart';
import 'package:history_hub_v2/app/modules/event/list_participant/widgets/participant_search_bar.dart';

class ListParticipantPage extends GetView<ListParticipantController> {
  const ListParticipantPage({super.key});

  static const routeName = "/list-participant";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: Get.back,
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                const Gap(8),
              ],
            ),
          ),
          const ParticipantSearcBar(),
          const Gap(16),
          Expanded(
            child: Obx(() {
              final status = controller.listParticipant.status;
              if (status == ResultStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary500,
                  ),
                );
              } else if (status == ResultStatus.error) {
                return Center(
                  child: Text(
                    controller.listParticipant.error.toString(),
                  ),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '${controller.listParticipant.data!.length} Orang terdaftar',
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: RefreshIndicator(
                        color: AppColors.primary500,
                        onRefresh: () async {
                          controller.getListEventParticipant();
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.listParticipant.data!.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              ListParticipantItem(
                                controller.listParticipant.data![index],
                              ),
                              if (index !=
                                  controller.listParticipant.data!.length - 1)
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Divider(
                                    color: AppColors.neutral200,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.scanQr,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/scan.svg',
                            colorFilter: const ColorFilter.mode(
                              AppColors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          const Gap(8),
                          Text(
                            'Scan Kedatangan',
                            style: AppTexts.primary
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
