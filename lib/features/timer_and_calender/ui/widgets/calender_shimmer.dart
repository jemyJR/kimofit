import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/timer_and_calender/logic/timer_and_calender_cubit.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/dropdown_menu_container_shimmer.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/timer/count_down_timer_row.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/timer/time_up_message.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/timer_and_calender_button.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/timer/timer_option.dart';
import 'package:kimofit/generated/l10n.dart';
import 'calender/custom_dropdown_shimmer.dart';

class CalenderShimmer extends StatelessWidget {
  const CalenderShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerAndCalenderCubit, TimerAndCalenderState>(
      builder: (context, state) {
        final cubit = context.read<TimerAndCalenderCubit>();
        final String iconPath = cubit.state is CalenderModeState
            ? Assets.animationTimer
            : Assets.animationCalendar;

        return Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () => cubit.toggleMode(),
                child: TimerAndCalenderButton(
                  iconPath: iconPath,
                ),
              ),
            ),
            getTimerAndCalenderChild(
              cubit: cubit,
              state: state,
            ),
          ],
        );
      },
    );
  }
}

Widget getTimerAndCalenderChild({
  required TimerAndCalenderCubit cubit,
  required TimerAndCalenderState state,
}) {
  if (state is CalenderModeState) {
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
