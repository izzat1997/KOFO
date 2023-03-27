import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:marvel/app/profile/controller/profile_controller.dart';
import 'package:marvel/core/exports.dart';

class ProfilePersonalPage extends StatelessWidget {
  const ProfilePersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Get.put(ProfileController());
    return Obx(() {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Personal information",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: BackButton(color: Theme.of(context).primaryColor),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                    width: 100.w,
                    padding: EdgeInsets.only(top: 4.w),
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      color: Colors.white,
                      child: Form(
                        key: user.updateForm(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Username",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                            SizedBox(height: 4.sp),
                            AppFormField(
                              hint: "chantaiman1234",
                              controller: user.usernameController(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter username';
                                }

                                return null;
                              },
                            ),
                            SizedBox(height: 16.sp),
                            Text(
                              "Email",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                            SizedBox(height: 4.sp),
                            AppFormField(
                              hint: "chantaiman@email.com",
                              controller: user.emailController(),
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
                            SizedBox(height: 16.sp),
                            Text(
                              "Name",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                            SizedBox(height: 4.sp),
                            AppFormField(
                              hint: "Tai man",
                              controller: user.nameController(),
                            ),
                            SizedBox(height: 16.sp),
                            Text(
                              "Phone",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                            SizedBox(height: 4.sp),
                            AppFormField(
                              hint: "12312321",
                              keyboardType: TextInputType.number,
                              controller: user.phoneController(),
                            ),
                            SizedBox(height: 16.sp),
                            Text(
                              "Address",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                            SizedBox(height: 4.sp),
                            AppFormField(
                              minLines: 3,
                              controller: user.addressController(),
                              hint: "Address detail : lorem ipsum\ndolor sit amet\nconsectetur adipiscing elit",
                            ),
                            SizedBox(height: 25.h)
                          ],
                        ),
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  elevation: 16,
                  child: Container(
                    width: 100.w,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(color: Colors.white),
                    child: AppButton(
                      onTap: () {
                        if (user.updateForm().currentState!.validate()) {
                          user.updateProfile();
                        }
                      },
                      title: "Save",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
