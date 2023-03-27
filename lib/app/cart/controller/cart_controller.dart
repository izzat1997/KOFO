import 'package:get/get.dart';
import 'package:marvel/app/shop/models/product_model.dart';
import 'package:marvel/core/storage.dart';

class CartController extends AppStorage {
  //
  final item = {"item": ""}.obs;
  // final itemList = [
  //   "Product name dolor sit amet consectetur",
  //   "Product name dolor sit amet consectetur",
  //   "Product name dolor sit amet consectetur",
  // ];

  final carts = <ItemCart>[].obs;

  void openQuatity(String index) {
    print(index);
    print(item()["item"]);
    if ("$index" == item()["item"]) {
      item()["item"] = '';
    } else {
      item()["item"] = "$index";
    }
    item.refresh();
  }

  void addCart(Product p, int q) {
    carts.add(ItemCart(item: p, quantity: q));
  }

  double total(List<ItemCart> list) {
    double total = 0;
    for (var e in list) {
      int price =
          (int.parse(e.item!.price!) - int.parse(e.item!.commission == "" ? "0" : e.item!.commission!)) * e.quantity;
      total += double.parse("$price");
    }

    return total;
  }

  void addQty(ItemCart item) {
    item.quantity++;
    carts.refresh();
  }

  void minusQty(ItemCart item) {
    if (item.quantity != 1) {
      item.quantity--;
      carts.refresh();
    }
  }
}

class ItemCart {
  int quantity;
  Product? item;
  ItemCart({required this.quantity, required this.item});
}
