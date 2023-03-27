import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marvel/app/auth/view/login_page.dart';
import 'package:marvel/core/exports.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Order",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: AppStorage().token == null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.w,
                ),
                AppButton(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      isScrollControlled: true,
                      builder: (BuildContext context) =>
                          Padding(padding: EdgeInsets.only(top: AppBar().preferredSize.height), child: LoginPage()),
                    );
                  },
                  border: Border.all(color: Theme.of(context).primaryColor),
                  title: "Please login to use this app",
                  color: Colors.transparent,
                  textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).primaryColor),
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                )
                // AppStorage().token == null) {
              ],
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 4.w),
                child: Column(
                  children: [
                    Container(
                      width: 100.w,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            width: 100.w,
                            padding: EdgeInsets.all(4.w),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icon/processing.svg",
                                  width: 16.sp,
                                ),
                                SizedBox(width: 12.sp),
                                Text(
                                  "Processing",
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp),
                                )
                              ],
                            ),
                          ),
                          Divider(color: Theme.of(context).hintColor),
                          Container(
                            width: 100.w,
                            padding: EdgeInsets.all(4.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Order #202209123456789", style: Theme.of(context).textTheme.labelMedium),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Order Date: 2022-08-11 12:31",
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                                ),
                                SizedBox(height: 5.sp),
                                Text("HK\$ 298.00",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.w),
                    Container(
                      width: 100.w,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            width: 100.w,
                            padding: EdgeInsets.all(4.w),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icon/done.svg",
                                  width: 16.sp,
                                ),
                                SizedBox(width: 12.sp),
                                Text(
                                  "Completed",
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp),
                                )
                              ],
                            ),
                          ),
                          Divider(color: Theme.of(context).hintColor),
                          SizedBox(height: 5.sp),
                          Column(
                            children: List.generate(
                              15,
                              (index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Order #202209123456789",
                                                    style: Theme.of(context).textTheme.labelMedium),
                                                SizedBox(height: 5.sp),
                                                Text(
                                                  "Order Date: 2022-08-11 12:31",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall!
                                                      .copyWith(color: Colors.grey),
                                                ),
                                                SizedBox(height: 5.sp),
                                                Text("HK\$ 298.00",
                                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                                        color: Theme.of(context).primaryColor,
                                                        fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        AppButton(
                                          title: "Reorder",
                                          width: 25.w,
                                          height: 4.7.h,
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5.sp),
                                      child: Divider(color: Theme.of(context).hintColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
