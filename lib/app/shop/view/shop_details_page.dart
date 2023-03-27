import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:marvel/app/shop/controller/shop_controller.dart';
import 'package:marvel/app/shop/models/product_model.dart';
import 'package:marvel/app/shop/models/review_model.dart';
import 'package:marvel/app/shop/models/vendor_model.dart';
import 'package:marvel/app/shop/view/shop_products_page.dart';
import 'package:marvel/app/shop/view/shop_reviews_page.dart';
import 'package:marvel/app/shop/view/submit_review.dart';
import 'package:marvel/app/shop/widgets/product_single.dart';
import 'package:marvel/core/exports.dart';
import 'package:marvel/core/presentations/widgets/app_header.dart';

class ShopDetailsPage extends StatelessWidget {
  const ShopDetailsPage({super.key, required this.vendor});
  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    var shop = Get.find<ShopController>();
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          vendor.name!,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 4.w),
          child: Column(
            children: [
              Container(
                width: 100.w,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vendor.name!,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(height: 4.sp),
                    Text(
                      "Shop description : ${vendor.description}",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Theme.of(context).hintColor),
                    ),
                    SizedBox(height: 12.sp),
                    Obx(() {
                      shop.vendors().length;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => shop.createLike(vendor: vendor),
                            child: Container(
                              height: 5.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icon/like-shop-on.svg",
                                  ),
                                  SizedBox(width: 5.sp),
                                  Text(
                                    "${vendor.likeCount ?? 0}",
                                    style: Theme.of(context).textTheme.displayMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 5.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).hintColor),
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icon/reviews.svg",
                                  color: Theme.of(context).hintColor,
                                ),
                                SizedBox(width: 5.sp),
                                Text(
                                  "${vendor.resources!.commentCount!.totalCount ?? 0}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Theme.of(context).hintColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    })
                  ],
                ),
              ),
              SizedBox(height: 8.sp),
              Obx(
                () {
                  List<Product> products = [];
                  for (var e in shop.products) {
                    if (e.vendor!.contains(vendor.id!)) {
                      products.add(e);
                    }
                  }
                  return AppHeader(
                    svgAsset: "assets/icon/product.svg",
                    title: "Product",
                    body: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Column(
                        children: [
                          products.isEmpty
                              ? Container(
                                  margin: EdgeInsets.symmetric(vertical: 3.h),
                                  child: Text("${vendor.name} dont have any product yet"),
                                )
                              : Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: List.generate(
                                    products.length,
                                    (index) => ProductSingle(
                                      product: products[index],
                                    ),
                                  ),
                                ),
                          SizedBox(height: 8.sp),
                          if (products.isNotEmpty)
                            AppButton(
                              onTap: () => Get.to(ShopProductsPage(
                                products: products,
                              )),
                              title: "Show All Products",
                            )
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 8.sp),
              Obx(() {
                List<Review> reviews = [];
                for (var e in shop.reviews) {
                  if (e.vendor!.toLowerCase().contains(vendor.slug!.toLowerCase())) {
                    reviews.add(e);
                  }
                }
                return AppHeader(
                  svgAsset: "assets/icon/reviews.svg",
                  title: "Reviews",
                  body: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Column(
                      children: [
                        reviews.isEmpty
                            ? Container(
                                margin: EdgeInsets.symmetric(vertical: 3.h),
                                child: Text("${vendor.name} not receive any review yet"),
                              )
                            : Column(
                                children: List.generate(
                                  reviews.length,
                                  (index) => ReviewSingle(
                                    review: reviews[index],
                                    isLast: reviews.last.id == reviews[index].id,
                                  ),
                                ),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButton(
                              onTap: () => Get.to(ShopReviewPage(
                                reviews: reviews,
                              )),
                              title: "Show All",
                              color: Colors.white,
                              border: Border.all(color: Theme.of(context).hintColor),
                              textStyle: Theme.of(context).textTheme.labelMedium,
                              height: 5.h,
                              width: 45.w,
                            ),
                            AppButton(
                              onTap: () {
                                if (AppStorage().token == null) {
                                  AppSnackbar.success("Unauthenticated", "Please login to leave a review");
                                } else {
                                  Get.to(ShopSubmitReview(
                                    vendor: vendor,
                                  ));
                                }
                              },
                              title: "Leave a review",
                              height: 5.h,
                              width: 45.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewSingle extends StatelessWidget {
  ReviewSingle({
    super.key,
    required this.review,
    this.isLast,
  });

  final Review review;

  bool? isLast = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100.w,
          padding: EdgeInsets.symmetric(vertical: 5.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${review.resources!.account!.username} - ${review.createdAt}",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Theme.of(context).hintColor),
              ),
              SizedBox(height: 6.sp),
              Text(
                "${review.content}",
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ),
        isLast != true ? Divider(color: Theme.of(context).hintColor) : SizedBox(height: 10.sp)
      ],
    );
  }
}
