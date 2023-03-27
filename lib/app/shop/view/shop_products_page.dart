import 'package:get/get.dart';
import 'package:marvel/app/shop/controller/shop_controller.dart';
import 'package:marvel/app/shop/models/product_model.dart';
import 'package:marvel/app/shop/models/vendor_model.dart';
import 'package:marvel/app/shop/widgets/product_single.dart';
import 'package:marvel/core/exports.dart';
import 'package:marvel/core/presentations/widgets/app_header.dart';

class ShopProductsPage extends StatelessWidget {
  const ShopProductsPage({super.key, required this.products});
  final List<Product> products;

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
            svgAsset: "assets/icon/product.svg",
            title: "Product (${products.length ?? 0})",
            body: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      products.length,
                      (index) => ProductSingle(
                        product: products[index],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
