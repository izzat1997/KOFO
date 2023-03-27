import 'package:get/get.dart';

class ProductController extends GetxController {
  final qty = 1.obs;

  void addQty(int left) {
    if (qty < left) {
      qty.value++;
    }
  }

  void minusQty() {
    if (qty.value != 1) {
      qty.value--;
    }
  }

  void addToCart() async {
    //
  }
}
