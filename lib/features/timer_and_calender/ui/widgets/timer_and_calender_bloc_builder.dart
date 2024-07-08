import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/timer_and_calender/logic/timer_and_calender_cubit.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/day_and_week_row.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/timer/count_down_timer_row.dart';
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
          final String iconPath = cubit.state is TimerOptionsModeState
              ? Assets.animationCalendar
              : Assets.animationTimer;

          final Widget child = cubit.state is TimerOptionsModeState
              ? TimerOption(onSelectDuration: (int duration) {})
              : DayAndWeekRow(days: days, weeks: weeks);

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
              // child,
              CountDownTimerRow(
                duration: 10,
                onComplete: () {},
                stop: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
