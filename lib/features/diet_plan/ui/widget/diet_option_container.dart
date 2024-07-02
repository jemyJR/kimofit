import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/features/diet_plan/data/models/option_model.dart';
import 'package:kimofit/features/diet_plan/ui/widget/ingredients_list_view_builder.dart';

class DietOptionContainer extends StatelessWidget {
  const DietOptionContainer({super.key, required this.option});
  final OptionModel option;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManager.dark,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IngredientsListViewBuilder(
                ingredients: option.ingredients,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
