import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/disable_splash_highlight.dart';
import 'package:kimofit/features/diet_plan/data/models/meal_model.dart';

class DietMeal extends StatelessWidget {
  const DietMeal({
    super.key,
    required this.meal,
    required this.options,
    this.initiallyExpanded = false,
  });
  final MealModel meal;
  final List<Widget> options;
  final bool? initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return DisableSplashHighlight(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded!,
          title: Text(
            meal.name.getLocalizedText(),
            style: TextStyles.font18White,
          ),
          leading: Icon(
            Icons.restaurant_menu,
            color: ColorsManager.white,
            size: 30.sp,
          ),
          backgroundColor: ColorsManager.blue,
          collapsedBackgroundColor: ColorsManager.dark,
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          textColor: Colors.white,
          iconColor: Colors.white,
          children: options,
        ),
      ),
    );
  }
}
