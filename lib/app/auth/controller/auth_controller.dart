import 'package:get/get.dart';
import 'package:marvel/app/auth/view/login_page.dart';
import 'package:marvel/app/bottom_nav/view/bottom_nav_page.dart';
import 'package:marvel/app/profile/model/user.dart';
import 'package:marvel/core/exports.dart';
import 'package:marvel/splash_page.dart';

class AuthController extends GetxController {
  final logUsernameController = TextEditingController().obs;
  final logPassController = TextEditingController().obs;
  //
  final regUsernameController = TextEditingController().obs;
  final regEmailController = TextEditingController().obs;
  final regPasswordController = TextEditingController().obs;

  final forgetEmail = TextEditingController().obs;
  final forgetUsername = TextEditingController().obs;

  final forgetForm = GlobalKey<FormState>().obs;
  final regForm = GlobalKey<FormState>().obs;
  final loginForm = GlobalKey<FormState>().obs;
  final showRegPassword = false.obs;
  final showLoginPassword = false.obs;

  final remember = true.obs;

  final user = User().obs;

  void changeShowReg() {
    showRegPassword.value = !showRegPassword.value;
  }

  void changeShowLogin() {
    showLoginPassword.value = !showLoginPassword.value;
  }

  void changeRemember() {
    remember.value = !remember.value;
  }

  void submitLogin() async {
    Get.context!.loaderOverlay.show();
    try {
      var res = await AuthRepo().login({
        "username": logUsernameController().text,
        "password": logPassController().text,
      });
      if (res.statusCode == 200) {
        var token = "${res.data['refreshToken']}";
        print("accessToken ${res.data['accessToken']}");
        print("refreshToken $token");
        user(User.fromJson(res.data['item']));
        AppStorage().setToken(token);
        AppStorage().setString(key: "userId", value: user().id!);
        AppSnackbar.success("Welcome", "Successfully Login");
        clearField();

        Get.offAll(SplashPage());
      } else {
        throw res.data;
      }
    } catch (e) {
      dynamic data = e;
      AppSnackbar.fail("Error", "Invalid Credential");
    }
    Get.context!.loaderOverlay.hide();
  }

  void submitSignup() async {
    var body = {
      "username": regUsernameController().text,
      "password": regPasswordController().text,
      "password2": regPasswordController().text,
      "email": regEmailController().text,
      "status": "CREATED",
      "displayID": "string",
      "roles": ["string"],
      "allowPermissionSet": ["string"],
      "denyPermissionSet": ["string"],
      "allowPermission": ["string"],
      "denyPermission": ["string"],
      "stripeCustomerId": "string",
      "oAuthGoogleId": "string",
      "createdBy": "25a02396-1048-48f9-bf93-102d2fb7895e"
    };

    Get.context!.loaderOverlay.show();
    try {
      var res = await AuthRepo().signUp(body);
      if (res.statusCode == 200) {
        AppSnackbar.success("Success", "Your account has been registered!");
      } else {
        throw res.data;
      }
    } catch (e) {
      dynamic data = e;
      AppSnackbar.fail("${data['statusCode']}", "${data['message']}");
    }
    Get.context!.loaderOverlay.hide();
  }

  void getUserData() async {
    print("User id ${AppStorage().userId}");
    var res = await AuthRepo().userData(AppStorage().userId);
    print("Result get userDta ${res.statusCode}");
    if (res.statusCode == 200) {
      user(User.fromJson(res.data['item']));
    }
  }

  void forgetPassword() async {
    Get.context!.loaderOverlay.show();
    var body = {"username": "${forgetUsername().text}", "email": "${forgetEmail().text}"};
    var res = await AuthRepo().forgotPassword(body);
    if (res.statusCode == 200) {
      Navigator.pop(Get.context!);
      AppSnackbar.success("Success", "Forget password has been submitted! Please check your email");
    } else {
      AppSnackbar.fail("Error", res.data['message']);
    }
    Get.context!.loaderOverlay.hide();
  }

  void clearField() {
    logUsernameController().text = '';
    logPassController().text = '';
    regUsernameController().text = '';
    regEmailController().text = '';
    regPasswordController().text = '';
    forgetEmail().text = '';
    forgetUsername().text = '';
  }
}
