import 'package:get/get.dart';
import 'package:marvel/core/exports.dart';

class BottomController extends GetxController {
  final currentIndex = 0.obs;
  final pageControler = PageController().obs;

  void updatePage(int i) {
    currentIndex(i);
    pageControler().animateToPage(
      currentIndex(),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
