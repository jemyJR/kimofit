import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/disable_splash_highlight.dart';
import 'package:kimofit/features/timer_and_calender/data/calender_list.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/dropdown_menu_container_shimmer.dart';

class CustomDropdownShimmer extends StatelessWidget {
  const CustomDropdownShimmer({super.key, required this.type});

  final ShimmerType type;
  @override
  Widget build(BuildContext context) {
    return DisableSplashHighlight(
      child: SizedBox(
        height: 60.h,
        width: 120.w,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<LocalizedField>(
            elevation: 0,
            value: type == ShimmerType.day ? days.first : weeks.first,
            isExpanded: true,
            icon: const SizedBox.shrink(),
            dropdownColor: ColorsManager.dark,
            style: TextStyles.font18White,
            itemHeight: 70.h,
            items: type == ShimmerType.day
                ? days
                    .map(
                      (day) => DropdownMenuItem<LocalizedField>(
                        value: day,
                        child: DropdownMenuContainerShimmer(type: type),
                      ),
                    )
                    .toList()
                : weeks
                    .map(
                      (week) => DropdownMenuItem<LocalizedField>(
                        value: week,
                        child: DropdownMenuContainerShimmer(type: type),
                      ),
                    )
                    .toList(),
            onChanged: (LocalizedField? newValue) {},
          ),
        ),
      ),
    );
  }
}
