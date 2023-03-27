import 'package:get/get.dart';
import 'package:marvel/app/auth/view/login_page.dart';
import 'package:marvel/app/bottom_nav/controller/btm_controller.dart';
import 'package:marvel/app/cart/controller/cart_controller.dart';
import 'package:marvel/app/cart/view/cart_page.dart';
import 'package:marvel/app/home/view/home_page.dart';
import 'package:marvel/app/orders/view/order_page.dart';
import 'package:marvel/app/profile/view/profile_page.dart';
import 'package:marvel/core/exports.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    var btm = Get.put(BottomController());
    Get.put(CartController());
    return Obx(() {
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: Theme.of(context).textTheme.displaySmall,
            unselectedLabelStyle: Theme.of(context).textTheme.displaySmall,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/png_icon/navbar-home-off@2x.png")),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/png_icon/navbar-cart-off@2x.png")),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/png_icon/navbar-order-off@2x.png")),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/png_icon/navbar-profile-off@2x.png")),
                label: 'Profile',
              ),
            ],
            currentIndex: btm.currentIndex(),
            unselectedItemColor: const Color(0xFFa6a6a6),
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: (v) {
              if (v == 3 && AppStorage().token == null) {
                showModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  isScrollControlled: true,
                  builder: (BuildContext context) =>
                      Padding(padding: EdgeInsets.only(top: AppBar().preferredSize.height), child: LoginPage()),
                );
              } else {
                btm.updatePage(v);
              }
            },
          ),
          body: PageView(
            controller: btm.pageControler(),
            children: const [
              HomePage(),
              CartPage(),
              OrderPage(),
              ProfilePage(),
            ],
          ));
    });
  }
}
