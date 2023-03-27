import 'package:get/get.dart';
import 'package:marvel/app/shop/controller/shop_controller.dart';
import 'package:marvel/app/shop/widgets/product_single.dart';
import 'package:marvel/app/shop/widgets/shop_single.dart';
import 'package:marvel/core/exports.dart';
import 'package:marvel/core/presentations/widgets/app_header.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var vend = Get.put(ShopController());
    return Obx(() {
      return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 4.w),
              padding: EdgeInsets.only(top: AppBar().preferredSize.height, right: 4.w, left: 2.w, bottom: 3.w),
              child: Row(
                children: [
                  BackButton(color: Theme.of(context).primaryColor),
                  Expanded(
                    child: TextFormField(
                      controller: vend.searchController(),
                      onChanged: (value) => vend.getSearchData(),
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Search for product or shop name",
                        fillColor: Color(0xFFF2F2F2),
                        contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF2F2F2)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF2F2F2)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            vend.isLoading()
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (vend.fVendors.isNotEmpty)
                          AppHeader(
                            svgAsset: "assets/icon/restaurant.svg",
                            title: "Shop",
                            body: Container(
                              width: 100.w,
                              padding: EdgeInsets.all(4.w),
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(
                                  vend.fVendors.length,
                                  (index) => ShopSingle(
                                    vendor: vend.fVendors[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(height: 8.sp),
                        if (vend.fProducts.isNotEmpty)
                          AppHeader(
                            svgAsset: "assets/icon/product.svg",
                            title: "Product",
                            body: Container(
                              width: 100.w,
                              padding: EdgeInsets.all(4.w),
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(
                                  vend.fProducts.length,
                                  (index) => ProductSingle(
                                    product: vend.fProducts[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ))
          ],
        ),
      );
    });
  }
}
