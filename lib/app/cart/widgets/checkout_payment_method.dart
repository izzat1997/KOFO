import 'package:get/get.dart';
import 'package:marvel/app/cart/controller/checkout_controller.dart';
import 'package:marvel/core/exports.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
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
                  "assets/png_icon/profile-e-wallet@2x.png",
                  width: 16.sp,
                ),
                SizedBox(width: 12.sp),
                Text(
                  "Payment Method",
                  style:
                      Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16.sp),
            Obx(
              () => Row(
                children: List.generate(
                  checkout.paymentMethod.length,
                  (index) {
                    bool isSelected = checkout.paymentMethod[index] == checkout.payment();
                    return InkWell(
                      onTap: () => checkout.setPayment(checkout.paymentMethod()[index]),
                      child: Container(
                        width: c.maxWidth / 2,
                        height: 6.h,
                        decoration: BoxDecoration(
                            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: Color(0xFFDBDAE5))),
                        child: Center(
                          child: Text(
                            checkout.paymentMethod[index],
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
          ],
        );
      }),
    );
  }
}
