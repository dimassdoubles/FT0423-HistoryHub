import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/modules/transaction/payment/payment_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({super.key});

  static const routeName = '/payment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: WebViewWidget(
          controller: controller.webViewController,
        ),
      ),
    );
  }
}
