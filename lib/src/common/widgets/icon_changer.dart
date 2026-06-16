import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsk_4/src/common/style/app_icons.dart';

class IconChanger extends StatelessWidget {
  final int wmoCode;

  final String iconCode;

  final double size;

  const IconChanger({
    super.key,
    required this.wmoCode,
    required this.iconCode,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDay = iconCode.endsWith('d');

    final String iconPath = switch (wmoCode) {
      800 => isDay ? AppIcons.sun : AppIcons.moon,

      801 || 802 => isDay ? AppIcons.cloudlySun : AppIcons.cloudlyMoon,

      803 || 804 => AppIcons.cloudlySun,

      511 => AppIcons.hail,

      210 || 211 || 212 || 221 => AppIcons.thunder,

      200 || 201 || 202 || 230 || 231 || 232 => AppIcons.rainyThunder,

      300 ||
      301 ||
      302 ||
      310 ||
      311 ||
      312 ||
      313 ||
      314 ||
      321 ||
      500 ||
      501 ||
      502 ||
      503 ||
      504 ||
      520 ||
      521 ||
      522 ||
      531 => AppIcons.rainy,

      600 ||
      601 ||
      602 ||
      611 ||
      612 ||
      613 ||
      615 ||
      616 ||
      620 ||
      621 ||
      622 => AppIcons.snow,

      741 => AppIcons.fog,

      701 ||
      711 ||
      721 ||
      731 ||
      751 ||
      761 ||
      762 ||
      771 ||
      781 => AppIcons.windy,

      _ => isDay ? AppIcons.sun : AppIcons.moon,
    };

    return SvgPicture.asset(iconPath, height: size, width: size);
  }
}
