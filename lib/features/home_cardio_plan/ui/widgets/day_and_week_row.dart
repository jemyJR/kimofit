import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/home_cardio_plan/ui/widgets/custom_dropdown_bloc_builder.dart';
import 'package:kimofit/generated/l10n.dart';

class DayAndWeekRow extends StatelessWidget {
  final List<LocalizedField> days;
  final List<LocalizedField> weeks;

  const DayAndWeekRow({
    super.key,
    required this.days,
    required this.weeks,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildColumn(
              context, S.of(context).dayNamber, days, Constants.selectedDay),
          _buildColumn(
              context, S.of(context).weekNamber, weeks, Constants.selectedWeek),
        ],
      ),
    );
  }

  Widget _buildColumn(BuildContext context, String label,
      List<LocalizedField> items, String preferenceKey) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyles.font15White,
        ),
        verticalSpace(2),
        CustomDropdownBlocBuilder(
          list: items,
          preferenceKey: preferenceKey,
        ),
      ],
    );
  }
}
