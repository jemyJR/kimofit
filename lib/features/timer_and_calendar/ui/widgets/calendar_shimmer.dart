import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/timer_and_calendar/logic/timer_and_calendar_cubit.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/calendar/dropdown_menu_container_shimmer.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/timer/count_down_timer_row.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/timer/time_up_message.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/timer_and_calendar_button.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/timer/timer_option.dart';
import 'package:kimofit/generated/l10n.dart';
import 'calendar/custom_dropdown_shimmer.dart';

class CalendarShimmer extends StatelessWidget {
  const CalendarShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerAndCalendarCubit, TimerAndCalendarState>(
      builder: (context, state) {
        final cubit = context.read<TimerAndCalendarCubit>();
        final String iconPath = cubit.state is CalendarModeState
            ? Assets.animationTimer
            : Assets.animationCalendar;

        return Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () => cubit.toggleMode(),
                child: TimerAndCalendarButton(
                  iconPath: iconPath,
                ),
              ),
            ),
            getTimerAndCalendarChild(
              cubit: cubit,
              state: state,
            ),
          ],
        );
      },
    );
  }
}

Widget getTimerAndCalendarChild({
  required TimerAndCalendarCubit cubit,
  required TimerAndCalendarState state,
}) {
  if (state is CalendarModeState) {
    return const DayAndWeekRowShimmer();
  } else if (state is TimerOptionsModeState) {
    return TimerOption(
      onSelectDuration: (int duration) {
        cubit.startCountDown(duration);
      },
    );
  } else if (state is CountdownTimerState) {
    return CountDownTimerRow(
      duration: state.duration,
      onComplete: () => cubit.endCountDown(),
      stop: () => cubit.showTimerOptions(),
    );
  } else if (state is TimeUpModeState) {
    return TimeUpMessage(
      onPressed: () => cubit.showTimerOptions(),
    );
  } else {
    return const DayAndWeekRowShimmer();
  }
}

class DayAndWeekRowShimmer extends StatelessWidget {
  const DayAndWeekRowShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildColumn(
          label: S.of(context).dayNamber,
          child: const CustomDropdownShimmer(type: ShimmerType.day),
        ),
        _buildColumn(
          label: S.of(context).weekNamber,
          child: const CustomDropdownShimmer(type: ShimmerType.week),
        ),
      ],
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
