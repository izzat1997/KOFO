import 'package:marvel/core/exports.dart';

class AppFormField extends StatelessWidget {
  AppFormField({
    super.key,
    this.hint,
    this.obscureText,
    this.suffixIcon,
    this.minLines,
    this.controller,
    this.keyboardType,
    this.validator,
  });
  String? hint;
  bool? obscureText;
  Widget? suffixIcon;
  int? minLines;
  TextEditingController? controller;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.sp),
      validator: validator,
      obscureText: obscureText ?? false,
      maxLines: obscureText == true ? 1 : 3,
      minLines: minLines ?? 1,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        hintText: hint,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
