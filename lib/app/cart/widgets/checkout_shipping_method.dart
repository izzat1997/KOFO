import 'package:get/get.dart';
import 'package:marvel/app/cart/controller/checkout_controller.dart';
import 'package:marvel/core/exports.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var checkout = Get.find<CheckOutController>();

    return Container(
      padding: EdgeInsets.all(4.w),
      color: Colors.white,
      child: LayoutBuilder(builder: (context, c) {
        return Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/png_icon/profile-address@2x.png",
                  width: 16.sp,
                ),
                SizedBox(width: 12.sp),
                Text(
                  "Shipping method",
                  style:
                      Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16.sp),
            Obx(
              () => Row(
                children: List.generate(
                  checkout.shippingMethods.length,
                  (index) {
                    bool isSelected = checkout.shippingMethods[index] == checkout.shipping();
                    return InkWell(
                      onTap: () => checkout.setShipping(checkout.shippingMethods()[index]),
                      child: Container(
                        width: c.maxWidth / 2,
                        height: 6.h,
                        decoration: BoxDecoration(
                            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: Color(0xFFDBDAE5))),
                        child: Center(
                          child: Text(
                            checkout.shippingMethods[index],
                            style: isSelected
                                ? Theme.of(context).textTheme.displayMedium
                                : Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 17.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address name",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(height: 4.sp),
                      Text(
                        "Address detail : lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/png_icon/edit@2x.png",
                  width: 16.sp,
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
