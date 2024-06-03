import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/midtrans_const.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/transaction/transaction_token_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum PaymentResult { success, pending, error, close }

class PaymentController extends GetxController {
  final AppDatasource datasource;
  PaymentController(this.datasource);

  @override
  void onInit() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'Android',
        onMessageReceived: (JavaScriptMessage receiver) {
          debugPrint('==========>>>>>>>>>>>>>> BEGIN');
          debugPrint(receiver.message);
          if (Platform.isAndroid) {
            if (receiver.message != 'undefined') {
              if (receiver.message == PaymentResult.close.name) {
                Get.back();
              } else {
                // handleResponse();
                Get.back();
              }
            }
          }
          debugPrint('==========>>>>>>>>>>>>>> END');
        },
      )
      ..loadHtmlString(snapHtml);

    super.onInit();
  }

  late final WebViewController webViewController;

  final TransactionTokenModel tokenModel = Get.arguments;

  late final String snapHtml = '''
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- @TODO: replace SET_YOUR_CLIENT_KEY_HERE with your client key -->
        <script type="text/javascript"
          src="https://app.sandbox.midtrans.com/snap/snap.js"
          data-client-key="${MidtransConst.clientKey}"></script>
        <!-- Note: replace with src="https://app.midtrans.com/snap/snap.js" for Production environment -->
      </head>

      <body onload="setTimeout(function() {pay()}, 1000)">
        <script type="text/javascript">
          function pay() {
            window.snap.pay('${tokenModel.token}', {
              onSuccess: function(result){
                Android.postMessage('${PaymentResult.success.name}');
              },
              onPending: function(result){
                Android.postMessage('${PaymentResult.pending.name}');
              },
              onError: function(result){
                Android.postMessage('${PaymentResult.error.name}');
              },
              onClose: function(){
                Android.postMessage('${PaymentResult.close.name}');
              }
            });
          }
        </script>
      </body>
    </html>
  ''';
}
