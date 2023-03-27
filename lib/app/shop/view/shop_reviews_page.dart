import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marvel/app/shop/models/review_model.dart';
import 'package:marvel/app/shop/view/shop_details_page.dart';
import 'package:marvel/core/exports.dart';
import 'package:marvel/core/presentations/widgets/app_header.dart';

class ShopReviewPage extends StatelessWidget {
  const ShopReviewPage({super.key, required this.reviews});
  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Shop name dolor sit amet ...",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 4.w),
          child: AppHeader(
            svgAsset: "assets/icon/review.svg",
            title: "Reviews (${reviews.length})",
            body: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: List.generate(
                  reviews.length,
                  (index) => ReviewSingle(
                    review: reviews[index],
                    isLast: reviews.last.id == reviews[index].id,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
