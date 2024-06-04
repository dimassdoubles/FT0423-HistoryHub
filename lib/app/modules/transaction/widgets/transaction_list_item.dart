import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/extensions/date_time_extension.dart';
import 'package:history_hub_v2/app/core/extensions/int_extension.dart';
import 'package:history_hub_v2/app/data/models/order/order_model.dart';
import 'package:history_hub_v2/app/modules/transaction/transaction_controller.dart';
import 'package:history_hub_v2/app/presentation/widgets/button/primary_button.dart';

class TransactionListItem extends GetView<TransactionController> {
  final OrderModel data;
  final int index;
  const TransactionListItem(this.data, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(
                0.2), // You can adjust the shadow color and opacity here
            blurRadius: 20, // Increase the blur radius for a smoother shadow
            spreadRadius:
                1, // Optional, adjust the spread radius to control the size of the shadow
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.eventNama),
          Gap(4.w),
          Text(data.createdAt.display()),
          Gap(8.w),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Total Pesanan'),
              Gap(4.w),
              Text(data.totalAmount.toIDR()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 150.w,
                child: PrimaryButton(
                  height: 36,
                  onPressed: () {},
                  name: 'Bayar',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
