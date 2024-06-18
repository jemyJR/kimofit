import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/home/ui/widgets/rotated_corner_badge_decoration.dart';
import 'package:kimofit/generated/l10n.dart';

class CustomHomeContainer extends StatelessWidget {
  const CustomHomeContainer({
    super.key,
    required this.navName,
    required this.text,
    required this.color,
    required this.imagePath,
    this.isPaid = false,
    this.isFree = true,
  });

  final String navName;
  final String text;
  final Color color;
  final String imagePath;
  final bool isPaid;
  final bool isFree;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => context.pushNamed(Routes.getRoutePath(navName)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        child: isPaid
            ? homeContainer(
                imagePath: imagePath,
                child: containerBorder(
                  child: containerWithText(
                    child: textAlignCenter(text: text),
                    color: color,
                  ),
                  color: color,
                ),
              )
            : Container(
                foregroundDecoration: isFree
                    ? rotatedCornerBadgeDecoration(text: S.of(context).free)
                    : null,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    isFree
                        ? Colors.transparent
                        : ColorsManager.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                  child: homeContainer(
                    imagePath: imagePath,
                    child: containerBorder(
                      child: containerWithText(
                        child: textAlignCenter(text: text),
                        color: color,
                      ),
                      color: color,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

Widget homeContainer({required String imagePath, required Widget child}) {
  return Container(
    height: 150.h,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(imagePath),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          ColorsManager.black.withOpacity(0.2),
          BlendMode.darken,
        ),
      ),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: child,
  );
}

Widget containerBorder({required Widget child, required Color color}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    ),
  );
}

Widget containerWithText({required Widget child, required Color color}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 50.w),
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    ),
  );
}

Widget textAlignCenter({required String text}) {
  return Align(
    alignment: Alignment.center,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Text(
        text,
        style: TextStyles.font18White,
      ),
    ),
  );
}
