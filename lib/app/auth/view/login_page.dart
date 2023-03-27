import 'package:get/get.dart';
import 'package:marvel/app/auth/controller/auth_controller.dart';
import 'package:marvel/app/auth/view/register_page.dart';
import 'package:marvel/app/auth/view/reset_page.dart';
import 'package:marvel/core/exports.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = Get.find<AuthController>();
    return Obx(() {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
            child: Form(
              key: auth.loginForm(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let’s get you started!",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.sp),
                  Opacity(
                    opacity: .4,
                    child: Text(
                      "Continue to your kofo account",
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Color(0xFF141414)),
                    ),
                  ),
                  SizedBox(height: 9.sp),
                  AppFormField(
                    controller: auth.logUsernameController(),
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
                    controller: auth.logPassController(),
                    hint: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    obscureText: !auth.showLoginPassword(),
                    suffixIcon: InkWell(
                      onTap: () => auth.changeShowLogin(),
                      child: Container(
                        padding: EdgeInsets.all(3.w),
                        child: SvgPicture.asset(
                          !auth.showLoginPassword() ? "assets/icon/pw-show.svg" : "assets/icon/pw-hide.svg",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 9.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) => Theme.of(context).primaryColor),
                            value: auth.remember(),
                            onChanged: (bool? value) => auth.changeRemember(),
                          ),
                          Text(
                            "Remember Me",
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () => Get.to(ResetPasswordPage()),
                        child: Text(
                          "Forgot Password?",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 9.sp),
                  AppButton(
                    // onTap: () => auth.submitLogin(),
                    onTap: () {
                      if (auth.loginForm().currentState!.validate()) {
                        auth.submitLogin();
                      }
                    },
                    title: "Continue",
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
                      border: Border.all(color: Color.fromARGB(255, 205, 204, 204)),
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
                  SizedBox(height: 9.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have account yet?",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(width: 5.sp),
                      InkWell(
                        onTap: () => Get.to(RegisterPage()),
                        child: Text(
                          "Sign Up",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
