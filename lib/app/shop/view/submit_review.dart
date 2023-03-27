import 'package:get/get.dart';
import 'package:marvel/app/shop/controller/shop_controller.dart';
import 'package:marvel/app/shop/models/vendor_model.dart';
import 'package:marvel/core/exports.dart';
import 'package:marvel/core/presentations/widgets/app_header.dart';

class ShopSubmitReview extends StatelessWidget {
  const ShopSubmitReview({super.key, required this.vendor});

  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    var shop = Get.find<ShopController>();
    return Obx(() {
      return Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Shop review",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 100.w,
                  margin: EdgeInsets.symmetric(vertical: 4.w),
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shop name dolor sit amet consectetur",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        "Shop description : Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.sp),
                        child: Divider(color: Theme.of(context).hintColor),
                      ),
                      Text(
                        "Review",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey),
                      ),
                      SizedBox(height: 5.sp),
                      AppFormField(
                        minLines: 3,
                        controller: shop.commentController(),
                        hint: "Leave your review",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    children: [
                      AppButton(
                        onTap: () {
                          shop.createComment(vendor: vendor, comment: shop.commentController().text);
                        },
                        title: "Submit",
                      ),
                      AppButton(
                        onTap: () => Get.back(),
                        title: "Cancel",
                        color: Colors.transparent,
                        textStyle: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Color.fromARGB(255, 107, 107, 107)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }
}
