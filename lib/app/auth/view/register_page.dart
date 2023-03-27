import 'package:get/get.dart';
import 'package:marvel/app/auth/controller/reg_controller.dart';
import 'package:marvel/app/profile/view/profile_personal_page.dart';
import 'package:marvel/core/exports.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = Get.put(RegController());
    return Obx(() {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: BackButton(color: Theme.of(context).primaryColor),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
            child: Form(
              key: auth.regForm(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.sp),
                  Opacity(
                    opacity: .4,
                    child: Text(
                      "Create your kofo account",
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Color(0xFF141414)),
                    ),
                  ),
                  SizedBox(height: 9.sp),
                  AppFormField(
                    controller: auth.regUsernameController(),
                    hint: "Username",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 9.sp),
                  AppFormField(
                    controller: auth.regEmailController(),
                    hint: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      if (!value.isValidEmail()) {
                        return "Invalid Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 9.sp),
                  AppFormField(
                    controller: auth.regPasswordController(),
                    hint: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    obscureText: auth.showRegPassword(),
                    suffixIcon: InkWell(
                      onTap: () => auth.changeShowReg(),
                      child: Container(
                        padding: EdgeInsets.all(3.w),
                        child: SvgPicture.asset(
                          !auth.showRegPassword() ? "assets/icon/pw-show.svg" : "assets/icon/pw-hide.svg",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 9.sp),
                  AppButton(
                    title: "Continue",
                    onTap: () {
                      if (auth.regForm().currentState!.validate()) {
                        auth.submitSignup();
                      }
                    },
                  ),
                  SizedBox(height: 5.sp),
                  Stack(
                    children: [
                      const Divider(),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            "Or",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5.sp),
                  Container(
                    width: 100.w,
                    height: 7.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 9.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFFCDCCCC)),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          "assets/icon/google.svg",
                          width: 6.w,
                          height: 6.w,
                        ),
                        Text(
                          "Continue with Google",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          width: 6.w,
                          height: 6.w,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
