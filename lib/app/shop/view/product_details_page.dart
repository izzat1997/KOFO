import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:marvel/app/bottom_nav/controller/btm_controller.dart';
import 'package:marvel/app/cart/controller/cart_controller.dart';
import 'package:marvel/app/shop/controller/product_controller.dart';
import 'package:marvel/app/shop/models/product_model.dart';
import 'package:marvel/core/exports.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    var p = Get.put(ProductController());
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "${product.name}",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Theme.of(context).primaryColor),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 4.w),
              child: Column(
                children: [
                  Container(
                    width: 100.w,
                    color: Colors.white,
                    padding: EdgeInsets.all(4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product.name}",
                          maxLines: 2,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(height: 4.sp),
                        Text(
                          "Product description : ${product.description}",
                          maxLines: 2,
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Theme.of(context).hintColor),
                        ),
                        SizedBox(height: 10.sp),
                        Row(
                          children: [
                            Text(
                              "\$${int.parse(product.price!) - int.parse(product.commission == "" ? "0" : product.commission!)}",
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$${product.price}",
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Theme.of(context).hintColor, decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 100.w,
                    margin: EdgeInsets.only(top: 4.w),
                    color: Colors.white,
                    padding: EdgeInsets.all(4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(height: 16.sp),
                        Text(
                          "${product.description}",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Obx(() => Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  elevation: 16,
                  child: Container(
                    width: 100.w,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () => p.minusQty(),
                                child: Image.asset(
                                  p.qty() == 1 ? "assets/png_icon/minus-off@2x.png" : "assets/png_icon/minus-on@2x.png",
                                  width: 18.sp,
                                  height: 18.sp,
                                ),
                              ),
                              Text(
                                "${p.qty.value}",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              InkWell(
                                onTap: () => p.addQty(int.parse(product.remainingQuantity!)),
                                child: Image.asset(
                                  p.qty() == int.parse(product.remainingQuantity!)
                                      ? "assets/png_icon/plus-off@2x.png"
                                      : "assets/png_icon/plus-on@2x.png",
                                  width: 18.sp,
                                  height: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.sp),
                        AppButton(
                          onTap: () {
                            if (AppStorage().token == null) {
                              AppSnackbar.success("Unauthenticated", "Please login to continue shopping");
                            } else {
                              Get.find<CartController>().addCart(product, p.qty.value);
                              Navigator.popUntil(context, (route) => route.isFirst);
                              Future.delayed(Duration(milliseconds: 300), () {
                                Get.find<BottomController>().updatePage(1);
                                AppSnackbar.success("Added to cart", "${product.name} added to your cart");
                              });
                            }
                          },
                          title: "Add to cart",
                          height: 6.h,
                          width: 65.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
