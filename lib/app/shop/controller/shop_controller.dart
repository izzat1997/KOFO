import 'package:get/get.dart';
import 'package:marvel/app/auth/controller/auth_controller.dart';
import 'package:marvel/app/shop/models/product_model.dart';
import 'package:marvel/app/shop/models/review_model.dart';
import 'package:marvel/app/shop/models/vendor_model.dart';
import 'package:marvel/app/shop/repository/shop_repo.dart';
import 'package:marvel/core/exports.dart';

class ShopController extends GetxController {
  final vendors = <Vendor>[].obs;
  final products = <Product>[].obs;
  final fVendors = <Vendor>[].obs;
  final fProducts = <Product>[].obs;

  final searchController = TextEditingController().obs;

  final commentController = TextEditingController().obs;

  final reviews = <Review>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    searchVendor();
    getComments();
  }

  void searchVendor() async {
    isLoading(true);
    try {
      var shop = await ShopRepo().searchShop();
      var product = await ShopRepo().searchProduct();
      var v = VendorModel.fromJson(shop.data);
      var p = ProductModel.fromJson(product.data);
      vendors.addAll(v.vendors!);
      products.addAll(p.products!);
      products.refresh();
      vendors.refresh();
      fVendors(vendors);
      fProducts(products);
    } catch (e) {}
    isLoading(false);
  }

  void getComments() async {
    reviews.clear();
    var res = await ShopRepo().getComments();
    reviews.addAll(ReviewModel.fromJson(res.data).reviews!);
  }

  void getSearchData() {
    List<Vendor> lVendors = [];
    List<Product> lProducts = [];

    for (var e in vendors) {
      if (e.name!.toLowerCase().contains(searchController().text.toLowerCase())) {
        lVendors.add(e);
      }
    }
    for (var e in products) {
      if (e.name!.toLowerCase().contains(searchController().text.toLowerCase())) {
        lProducts.add(e);
      }
    }
    fVendors(lVendors);
    fProducts(lProducts);
    fVendors.refresh();
    fProducts.refresh();
  }

  void createComment({Vendor? vendor, String? comment}) async {
    var user = Get.find<AuthController>();

    var userId = user.user().id;
    var body = {
      "account": "$userId",
      "vendor": vendor!.slug,
      "content": comment,
      "createdBy": "$userId",
    };
    print(body);
    try {
      var res = await ShopRepo().createComment(body);
      if (res.statusCode == 200) {
        AppSnackbar.success("Success!", "Comment has been submitted!");
        Get.find<ShopController>().getComments();
        Navigator.pop(Get.context!);
      } else {
        throw res.data;
      }
    } catch (e) {
      print(body);
      print(e);
      AppSnackbar.fail("Error!", "Something went wrong when submitting review");
    }
  }

  void createLike({Vendor? vendor}) async {
    Get.context!.loaderOverlay.show();

    var body = {
      "fireLike": true,
      "accountId": AppStorage().userId,
    };
    print("User Id ${AppStorage().userId}");
    try {
      var res = await ShopRepo().createLike(vendor!.slug!, body);
      if (res.statusCode == 200) {
        Get.find<ShopController>().searchVendor();
        vendor.liked = true;
      } else {
        throw res.data;
      }
    } catch (e) {
      print(body);
      print(e);
      dynamic er = e;
      AppSnackbar.fail("Error!", "${er['message']}");
    }
    Get.context!.loaderOverlay.hide();
  }
}
