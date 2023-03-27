import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:marvel/app/auth/controller/auth_controller.dart';
import 'package:marvel/core/exports.dart';
import 'package:marvel/core/presentations/widgets/button.dart';
import 'package:marvel/core/presentations/widgets/text_field.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = Get.find<AuthController>();
    return Obx(() {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: BackButton(color: Theme.of(context).primaryColor),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
          child: Form(
            key: auth.forgetForm(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reset password",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.sp),
                Opacity(
                  opacity: .4,
                  child: Text(
                    "Enter your username and email to reset  password",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Color(0xFF141414)),
                  ),
                ),
                SizedBox(height: 24.sp),
                AppFormField(
                  hint: "Username",
                  controller: auth.forgetUsername(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 9.sp),
                AppFormField(
                  controller: auth.forgetEmail(),
                  hint: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 9.sp),
                AppButton(
                  onTap: () {
                    if (auth.forgetForm().currentState!.validate()) {
                      auth.forgetPassword();
                    }
                  },
                  title: "Continue",
                ),
                SizedBox(height: 9.sp),
                const Divider(),
                SizedBox(height: 9.sp),
              ],
            ),
          ),
        ),
      );
    });
  }
}
