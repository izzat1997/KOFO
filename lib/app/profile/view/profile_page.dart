import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:marvel/app/auth/controller/auth_controller.dart';
import 'package:marvel/app/profile/model/user.dart';
import 'package:marvel/app/profile/view/profile_personal_page.dart';
import 'package:marvel/core/exports.dart';
import 'package:marvel/core/presentations/widgets/app_header.dart';
import 'package:marvel/splash_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 4.w),
          child: Column(
            children: [
              Obx(
                () {
                  User user = auth.user();
                  return AppHeader(
                    svgAsset: "assets/icon/profile-personal-information.svg",
                    title: "Personal Information",
                    suffixIcon: InkWell(
                      onTap: () => Get.to(ProfilePersonalPage()),
                      child: SvgPicture.asset(
                        "assets/icon/chevron.svg",
                        width: 16.sp,
                      ),
                    ),
                    body: Column(
                      children: [
                        ProfileItem(
                          title: "Username",
                          body: "${user.username}",
                        ),
                        ProfileItem(
                          title: "Email",
                          body: "${user.email}",
                        ),
                        ProfileItem(
                          title: "Name",
                          body: "${user.name}",
                        ),
                        ProfileItem(
                          title: "Phone",
                          body: "${user.phone}",
                        ),
                        ProfileItem(
                          title: "Address",
                          body: "Address detail : lorem ipsum\ndolor sit amet\nconsectetur adipiscing elit",
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 5.sp),
              AppHeader(
                svgAsset: "assets/icon/profile-e-wallet.svg",
                title: "E-Wallet",
                suffixIcon: SvgPicture.asset(
                  "assets/icon/chevron.svg",
                  width: 16.sp,
                ),
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Row(
                    children: [
                      Text("HK\$ 2498.00", style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.sp),
              AppHeader(
                svgAsset: "assets/icon/profile-language.svg",
                title: "Language",
                suffixIcon: SvgPicture.asset(
                  "assets/icon/chevron.svg",
                  width: 16.sp,
                ),
              ),
              SizedBox(height: 5.sp),
              InkWell(
                onTap: () {
                  AppStorage().clearAllData();
                  Get.offAll(SplashPage());
                },
                child: AppHeader(
                  svgAsset: "assets/icon/profile-logout.svg",
                  title: "Logout",
                ),
              ),
              SizedBox(height: 5.h)
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.body,
  });
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).hintColor),
          ),
          SizedBox(height: 6.sp),
          Text(
            body == "null" ? '' : body,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Divider(color: Theme.of(context).hintColor),
          ),
        ],
      ),
    );
  }
}
