import 'package:get/get.dart';
import 'package:marvel/app/auth/view/login_page.dart';
import 'package:marvel/app/bottom_nav/controller/btm_controller.dart';
import 'package:marvel/app/cart/controller/cart_controller.dart';
import 'package:marvel/app/cart/view/checkout_page.dart';
import 'package:marvel/app/cart/widgets/cart_item.dart';
import 'package:marvel/app/home/view/search_page.dart';
import 'package:marvel/core/exports.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.find<CartController>();
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Cart",
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
                padding: EdgeInsets.symmetric(vertical: 4.w),
                child: Column(
                  children: [
                    Obx(
                      () => Container(
                        width: 100.w,
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: List.generate(
                            c.carts.length,
                            (index) => Column(
                              children: [
                                CartItem(
                                  cartItem: c.carts[index],
                                  onQtyTap: () => c.openQuatity("$index"),
                                  isOpenQty: c.item()['item'] == "$index",
                                ),
                                Divider(color: Theme.of(context).hintColor),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.sp),
                    Container(
                      width: 100.w,
                      height: 8.h,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: Theme.of(context).hintColor)),
                          Obx(
                            () => Text(
                              "\$${c.total(c.carts)}",
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 12.sp, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 8.sp),
                    AppButton(
                      onTap: () {
                        if (c.carts.isEmpty) {
                          Get.find<BottomController>().updatePage(0);
                          Future.delayed(Duration(milliseconds: 300), () {
                            Get.to(SearchPage());
                          });
                        } else {
                          Get.to(CheckOutPage());
                        }
                      },
                      title: c.carts.isEmpty ? "Continue Shopping" : "Select address and payment ",
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
