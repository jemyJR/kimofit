import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/timer_and_calendar/data/calendar_list.dart';
import 'package:kimofit/features/timer_and_calendar/logic/calendar_cubit/calendar_cubit.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/calendar/custom_dropdown.dart';
import 'package:kimofit/generated/l10n.dart';

class CalendarRowBlocBuilder extends StatelessWidget {
  const CalendarRowBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        if (state is CalendarSuccess) {
          final cubit = context.read<CalendarCubit>();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColumn(
                label: S.of(context).dayNamber,
                child: CustomDropdown(
                  list: state.days,
                  selectedValue: state.selectedDay,
                  onChanged: (newDay) {
                    if (newDay != null) {
                      cubit.selectDay(newDay);
                    }
                  },
                ),
              ),
              _buildColumn(
                label: S.of(context).weekNamber,
                child: CustomDropdown(
                  list: weeks,
                  selectedValue: state.selectedWeek,
                  onChanged: (newWeek) {
                    if (newWeek != null) {
                      cubit.selectWeek(newWeek);
                    }
                  },
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildColumn({
    required String label,
    required Widget child,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyles.font15White,
        ),
        verticalSpace(2),
        child,
      ],
    );
  }
}
