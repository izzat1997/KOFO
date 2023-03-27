import 'package:get/get.dart';
import 'package:marvel/core/exports.dart';

class AppSnackbar {
  static success(String title, body) {
    Get.snackbar(title, body, colorText: Colors.white, backgroundColor: Theme.of(Get.context!).primaryColor);
  }

  static fail(String title, body) {
    Get.snackbar(title, body, colorText: Colors.white, backgroundColor: Colors.red);
  }
}
