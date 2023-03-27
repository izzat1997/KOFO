import 'package:get/get.dart';
import 'package:marvel/core/exports.dart';

import '../controller/cart_controller.dart';

class CartItem extends StatefulWidget {
  CartItem({super.key, this.onQtyTap, this.isOpenQty, required this.cartItem});

  Function()? onQtyTap;

  bool? isOpenQty = false;
  ItemCart cartItem;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  var cart = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: widget.onQtyTap,
                child: Container(
                  width: 12.w,
                  height: 10.w,
                  margin: EdgeInsets.only(right: 8.sp),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFDBDAE5)), borderRadius: BorderRadius.circular(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.cartItem.quantity}",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 1.w),
                      SvgPicture.asset(
                        "assets/icon/dropdown.svg",
                        width: 5.w,
                        height: 5.w,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "${widget.cartItem.item!.name}",
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.cartItem.item!.price}",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Theme.of(context).hintColor, decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                      "\$${int.parse(widget.cartItem.item!.price!) - int.parse(widget.cartItem.item!.commission == "" ? "0" : widget.cartItem.item!.commission!)}",
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              )
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: widget.isOpenQty == true ? 22.w : 0,
            height: 10.w,
            margin: EdgeInsets.only(left: 12.w + 8.sp),
            padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xFFDBDAE5)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: FittedBox(
              child: Obx(() {
                cart.carts.length;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => cart.minusQty(widget.cartItem),
                      child: Image.asset(
                        widget.cartItem.quantity != 1
                            ? "assets/png_icon/minus-on@2x.png"
                            : "assets/png_icon/minus-off@2x.png",
                        width: 16.sp,
                        height: 16.sp,
                      ),
                    ),
                    const VerticalDivider(color: Color(0xFFDBDAE5)),
                    InkWell(
                      onTap: () => cart.addQty(widget.cartItem),
                      child: Image.asset(
                        "assets/png_icon/plus-on@2x.png",
                        width: 16.sp,
                        height: 16.sp,
                      ),
                    ),
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
