import 'package:marvel/core/exports.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.margin,
    this.width,
    this.height,
    this.border,
    this.color,
    this.textStyle,
  });
  final String title;

  Function()? onTap;
  EdgeInsets? margin;
  double? width;
  double? height;
  Color? color;
  BoxBorder? border;
  TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 100.w,
        height: height ?? 7.h,
        margin: margin,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(2),
          border: border,
        ),
        child: Center(
          child: Text(
            title,
            style: textStyle ?? Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}
