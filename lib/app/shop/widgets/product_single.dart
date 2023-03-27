import 'package:get/get.dart';
import 'package:marvel/app/auth/controller/auth_controller.dart';
import 'package:marvel/app/shop/models/product_model.dart';
import 'package:marvel/app/shop/view/product_details_page.dart';
import 'package:marvel/core/exports.dart';

class ProductSingle extends StatelessWidget {
  const ProductSingle({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(ProductDetailsPage(
        product: product,
      )),
      child: Container(
        width: 50.w - 4.w - 8,
        height: 15.h,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: Theme.of(context).hintColor,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name!,
              maxLines: 2,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 4.sp),
            Text(
              "Product description : ${product.description}",
              maxLines: 2,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Theme.of(context).hintColor),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    SizedBox(width: 5.sp),
                    Text("\$${product.price}",
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Theme.of(context).hintColor, decoration: TextDecoration.lineThrough)),
                  ],
                ),
                Image.asset(
                  "assets/png_icon/plus-on@2x.png",
                  width: 16.sp,
                  height: 16.sp,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
