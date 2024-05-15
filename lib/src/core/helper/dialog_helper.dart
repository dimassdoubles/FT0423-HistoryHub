import 'package:flutter_easyloading/flutter_easyloading.dart';

class DialogHelper {
  DialogHelper._();

  static void showLoading() {
    EasyLoading.show(status: 'Loading...');
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }

  static void showError(String message) {
    EasyLoading.showError(message);
  }

  static void showSuccess(String message) {
    EasyLoading.showSuccess(message);
  }
}
