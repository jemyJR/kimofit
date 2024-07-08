import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/timer_and_calender/logic/timer_and_calender_cubit.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/day_and_week_row.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/timer/count_down_timer_row.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/timer/time_up_message.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/timer_and_calender_button.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/timer/timer_option.dart';

class TimerAndCalenderBlocBuilder extends StatelessWidget {
  const TimerAndCalenderBlocBuilder({
    super.key,
    required this.days,
    required this.weeks,
  });
  final List<LocalizedField> days;
  final List<LocalizedField> weeks;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerAndCalenderCubit(),
      child: BlocBuilder<TimerAndCalenderCubit, TimerAndCalenderState>(
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
                days: days,
                weeks: weeks,
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget getTimerAndCalenderChild({
  required TimerAndCalenderCubit cubit,
  required TimerAndCalenderState state,
  required List<LocalizedField>? days,
  required List<LocalizedField>? weeks,
}) {
  if (state is CalenderModeState) {
    return DayAndWeekRow(days: days!, weeks: weeks!);
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
    return DayAndWeekRow(days: days!, weeks: weeks!);
  }
}
