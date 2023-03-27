import 'package:get/get.dart';

class CheckOutController extends GetxController {
  //
  final shippingMethods = ["Delivery", "Mailbox"].obs;
  final paymentMethod = ["Stripe", "E-Wallet"].obs;

  final shipping = "Delivery".obs;
  final payment = "Stripe".obs;

  void setShipping(String str) => shipping(str);
  void setPayment(String str) => payment(str);
}
