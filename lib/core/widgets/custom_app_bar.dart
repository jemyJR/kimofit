import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final double? elevation;
  final double? scrolledUnderElevation;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = ColorsManager.bgDark,
    this.elevation = 0.5,
    this.scrolledUnderElevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      title: Text(
        title,
        style: TextStyles.font18White,
      ),
      leading: const BackButton(
        color: ColorsManager.white,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
