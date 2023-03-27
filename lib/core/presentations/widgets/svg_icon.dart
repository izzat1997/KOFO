import 'package:marvel/core/exports.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({super.key, required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: 24,
      height: 24,
    );
  }
}
