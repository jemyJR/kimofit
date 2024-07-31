import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/disable_splash_highlight.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/calendar/dropdown_menu_container.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.list,
    required this.selectedValue,
    required this.onChanged,
  });

  final List<LocalizedField> list;
  final LocalizedField? selectedValue;
  final void Function(LocalizedField?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DisableSplashHighlight(
      child: SizedBox(
        height: 60.h,
        width: 120.w,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<LocalizedField>(
            elevation: 0,
            value: selectedValue != null && list.contains(selectedValue)
                ? selectedValue
                : (list.isNotEmpty ? list.first : null),
            isExpanded: true,
            icon: const SizedBox.shrink(),
            dropdownColor: ColorsManager.dark,
            style: TextStyles.font18White,
            // To Avoid the kMinInteractiveDimension error (when make video fullscreen)
            itemHeight: 70.h >= 48.0 ? 70.h : 48.0,
            items: list.map((LocalizedField value) {
              return DropdownMenuItem<LocalizedField>(
                value: value,
                child: DropdownMenuContainer(
                  value: value.getLocalizedText(),
                  isSelected: value == selectedValue,
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
