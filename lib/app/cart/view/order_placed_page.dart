import 'package:get/get.dart';
import 'package:marvel/app/bottom_nav/controller/btm_controller.dart';
import 'package:marvel/core/exports.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Order #202209123456789",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
            Future.delayed(Duration(milliseconds: 300), () {
              Get.find<BottomController>().updatePage(2);
            });
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 4.w),
        child: Column(
          children: [
            Container(
              width: 100.w,
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/icon/check-box-on.svg",
                    width: 9.5.h,
                    height: 9.5.h,
                  ),
                  SizedBox(height: 3.sp),
                  Text(
                    "Your order has been placed!",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.sp),
            Container(
              width: 100.w,
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order details",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(height: 12.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your order number:",
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 2.sp),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(
                            "#202209123456789",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Theme.of(context).primaryColor),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery address:",
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text("Address detail : lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.sp),
                  Column(
                    children: List.generate(
                      3,
                      (index) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${index + 1}x",
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "Product Name",
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                              Text(
                                "\$31.0",
                                style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.sp),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Theme.of(context).hintColor),
                  SizedBox(height: 6.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "\$217.0",
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fee",
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "\$15.0",
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.sp),
                  Divider(color: Theme.of(context).hintColor),
                  SizedBox(height: 6.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        "HK\$ 15.0",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
