import 'package:marvel/core/exports.dart';

class AppHeader extends StatelessWidget {
  AppHeader({super.key, this.body, required this.svgAsset, required this.title, this.suffixIcon});

  Widget? body;
  final String svgAsset;
  final String title;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            width: 100.w,
            padding: EdgeInsets.all(4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      svgAsset,
                      width: 16.sp,
                    ),
                    SizedBox(width: 12.sp),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                suffixIcon ?? Container()
              ],
            ),
          ),
          if (body != null) Divider(color: Theme.of(context).hintColor),
          body ?? Container()
        ],
      ),
    );
  }
}
