import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/disable_splash_highlight.dart';
import 'package:kimofit/features/home_cardio_plan/logic/cubit/timer_and_calender_cubit.dart';
import 'package:kimofit/features/home_cardio_plan/ui/widgets/dropdown_menu_container.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.selectedValue,
    required this.list,
    required this.cubit,
    required this.preferenceKey,
  });

  final LocalizedField? selectedValue;
  final List<LocalizedField> list;
  final TimerAndCalenderCubit cubit;
  final String preferenceKey;

  @override
  Widget build(BuildContext context) {
    return DisableSplashHighlight(
      child: SizedBox(
        height: 60.h,
        width: 120.w,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<LocalizedField>(
            value: selectedValue ?? list.first,
            isExpanded: true,
            icon: const SizedBox.shrink(),
            dropdownColor: ColorsManager.dark,
            style: TextStyles.font18White,
            itemHeight: 70.h,
            items: list.map((LocalizedField value) {
              return DropdownMenuItem<LocalizedField>(
                value: value,
                child: DropdownMenuContainer(
                  value: value.getLocalizedText(),
                  isSelected: value == selectedValue,
                ),
              );
            }).toList(),
            onChanged: (LocalizedField? newValue) {
              if (newValue != null) {
                cubit.saveSelectedValue(
                  preferenceKey: preferenceKey,
                  value: newValue,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
