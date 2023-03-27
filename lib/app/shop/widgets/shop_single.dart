import 'package:get/get.dart';
import 'package:marvel/app/shop/models/vendor_model.dart';
import 'package:marvel/app/shop/view/shop_details_page.dart';
import 'package:marvel/core/exports.dart';

class ShopSingle extends StatelessWidget {
  const ShopSingle({
    super.key,
    required this.vendor,
  });
  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(ShopDetailsPage(
        vendor: vendor,
      )),
      child: Container(
        width: 50.w - 4.w - 8,
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
          ],
        ),
      ),
    );
  }
}
