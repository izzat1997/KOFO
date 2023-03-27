import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marvel/app/auth/controller/auth_controller.dart';
import 'package:marvel/app/bottom_nav/view/bottom_nav_page.dart';
import 'package:marvel/app/home/view/home_page.dart';
import 'package:marvel/core/exports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() {
    Get.put(AuthController());

    var token = AppStorage().token;
    Future.delayed(Duration(seconds: 1), () {
      if (token == null) {
        AppStorage().clearAllData();
        Get.offAll(BottomNavPage());
      } else {
        Get.put(AuthController()).getUserData();
        Get.offAll(BottomNavPage());
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
