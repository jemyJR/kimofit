import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';

class IngredientsListViewBuilder extends StatelessWidget {
  const IngredientsListViewBuilder({super.key, required this.ingredients});
  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Row(
            children: [
              index == 0
                  ? const Text('')
                  : Text(
                      '+',
                      style: TextStyles.font18YellowBold,
                    ),
              horizontalSpace(15),
              Expanded(
                child: Text(
                  ingredients[index],
                  style: TextStyles.font18White,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
