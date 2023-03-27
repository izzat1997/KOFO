import 'package:get/get.dart';
import 'package:marvel/app/cart/controller/cart_controller.dart';
import 'package:marvel/app/cart/controller/checkout_controller.dart';
import 'package:marvel/app/cart/view/order_placed_page.dart';
import 'package:marvel/app/cart/widgets/checkout_payment_method.dart';
import 'package:marvel/app/cart/widgets/checkout_shipping_method.dart';
import 'package:marvel/app/cart/widgets/checkout_summary.dart';
import 'package:marvel/core/exports.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var checkout = Get.put(CheckOutController());
    var cart = Get.find<CartController>();
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Theme.of(context).primaryColor),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 4.w),
                child: Column(
                  children: [
                    const ShippingMethod(),
                    SizedBox(height: 8.sp),
                    const PaymentMethod(),
                    SizedBox(height: 8.sp),
                    const OrderSummary(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              elevation: 16,
              child: Container(
                height: 16.h,
                width: 100.w,
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey),
                        ),
                        Obx(
                          () => Text(
                            "\$${cart.total(cart.carts)}",
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.sp),
                    Obx(() {
                      cart.carts.length;
                      return AppButton(
                          onTap: () {
                            Get.to(OrderPlacedPage());
                            cart.carts.clear();
                            cart.carts.refresh();
                          },
                          title: "Checkout");
                    })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
