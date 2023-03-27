import 'package:get/get.dart';
import 'package:marvel/app/cart/controller/cart_controller.dart';
import 'package:marvel/app/cart/controller/checkout_controller.dart';
import 'package:marvel/core/exports.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var checkout = Get.find<CheckOutController>();
    var cart = Get.find<CartController>();

    return Container(
      padding: EdgeInsets.all(4.w),
      color: Colors.white,
      child: LayoutBuilder(builder: (context, c) {
        return Obx(() {
          return Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/png_icon/summary@2x.png",
                    width: 16.sp,
                  ),
                  SizedBox(width: 12.sp),
                  Text(
                    "Order Summary",
                    style:
                        Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16.sp),
              Column(
                children: [
                  Column(
                    children: List.generate(
                      cart.carts.length,
                      (index) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${cart.carts[index].quantity}x",
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "${cart.carts[index].item!.name}",
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                              Text(
                                "\$${int.parse(cart.carts[index].item!.price!) - int.parse(cart.carts[index].item!.commission == "" ? "0" : cart.carts[index].item!.commission!)}",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 5.sp),
                          const Divider(color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "\$${cart.total(cart.carts)}",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fee",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey),
                      ),
                      Text(
                        "\$0",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              )
            ],
          );
        });
      }),
    );
  }
}
