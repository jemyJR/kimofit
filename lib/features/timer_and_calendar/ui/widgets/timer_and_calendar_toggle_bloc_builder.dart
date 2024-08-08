import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/features/timer_and_calendar/logic/timer_and_calendar_cubit.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/bloc_widgets/calendar_row_bloc_builder.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/timer/count_down_timer_row.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/timer/time_up_message.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/timer_and_calendar_button.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/timer/timer_option.dart';

class TimerAndCalendarToggleBlocBuilder extends StatelessWidget {
  const TimerAndCalendarToggleBlocBuilder({super.key});

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
    return const CalendarRowBlocBuilder();
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
    return const CalendarRowBlocBuilder();
  }
}
