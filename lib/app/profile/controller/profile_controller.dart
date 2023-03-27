import 'package:get/get.dart';
import 'package:marvel/app/auth/controller/auth_controller.dart';
import 'package:marvel/app/profile/repo/profile_repo.dart';
import 'package:marvel/core/exports.dart';

class ProfileController extends GetxController {
  //

  final nameController = TextEditingController(text: Get.find<AuthController>().user().name ?? '').obs;
  final usernameController = TextEditingController(text: Get.find<AuthController>().user().username ?? '').obs;
  final emailController = TextEditingController(text: Get.find<AuthController>().user().email ?? '').obs;
  final phoneController = TextEditingController(text: Get.find<AuthController>().user().phone ?? '').obs;
  final addressController = TextEditingController(text: '').obs;

  final updateForm = GlobalKey<FormState>().obs;

  void updateProfile() async {
    Get.context!.loaderOverlay.show();
    var body = {
      "name": nameController().text,
      "username": usernameController().text,
      "email": emailController().text,
      "phone": phoneController().text,
      "address": addressController().text,
    };
    var res = await ProfileRepo().updateProfile(body);
    if (res.statusCode == 200) {
      AppSnackbar.success("Success", "Profile successfully updated!");
      Get.find<AuthController>().getUserData();
      Navigator.pop(Get.context!);
    }
    Get.context!.loaderOverlay.hide();
  }
}
