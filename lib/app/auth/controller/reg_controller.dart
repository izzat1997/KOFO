import 'dart:convert';

import 'package:get/get.dart';
import 'package:marvel/core/exports.dart';

class RegController extends GetxController {
  final regUsernameController = TextEditingController().obs;
  final regEmailController = TextEditingController().obs;
  final regPasswordController = TextEditingController().obs;
  final regForm = GlobalKey<FormState>().obs;
  final showRegPassword = true.obs;

  void changeShowReg() {
    showRegPassword.value = !showRegPassword.value;
  }

  void submitSignup() async {
    var body = {
      "username": regUsernameController().text,
      "password": regPasswordController().text,
      "password2": regPasswordController().text,
      "email": regEmailController().text,
    };

    Get.context!.loaderOverlay.show();
    try {
      var res = await AuthRepo().signUp(body);
      if (res.statusCode == 200) {
        AppSnackbar.success("Success", "Your account has been registered!");
        Navigator.pop(Get.context!);
      } else {
        throw res.data;
      }
      print(res.statusCode);
    } catch (e) {
      dynamic data = e;
      // AppSnackbar.fail("${data['statusCode']}", "${data['message']}");
      AppSnackbar.fail("$e", "$e");
    }
    Get.context!.loaderOverlay.hide();
  }
}
