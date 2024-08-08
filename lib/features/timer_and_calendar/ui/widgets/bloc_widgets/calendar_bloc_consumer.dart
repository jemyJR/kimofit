import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/features/home_cardio_plan/data/enums/exercise_status_enum.dart';
import 'package:kimofit/features/timer_and_calendar/data/calendar_list.dart';
import 'package:kimofit/features/timer_and_calendar/logic/calendar_cubit/calendar_cubit.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/calendar_shimmer.dart';
import 'package:kimofit/features/timer_and_calendar/ui/timer_and_calendar_base.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/timer_and_calendar_toggle_bloc_builder.dart';

class CalendarBlocConsumer extends StatelessWidget {
  const CalendarBlocConsumer({
    super.key,
    required this.exerciseBodyCubit,
    required this.exerciseBodyBlocBuilder,
  });

  final dynamic exerciseBodyCubit;
  final Widget exerciseBodyBlocBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarCubit, CalendarState>(
      listener: (context, state) {
        if (state is CalendarSuccess) {
          final selectedDay = state.selectedDay;
          final selectedWeek = state.selectedWeek;

          if (selectedDay.en == restDay.en) {
            exerciseBodyCubit.type = ExerciseStatus.restDay;
          } else if (selectedDay.en == notFoundDay.en) {
            exerciseBodyCubit.type = ExerciseStatus.notFoundDay;
          } else {
            exerciseBodyCubit.type = ExerciseStatus.normalDay;
          }

          exerciseBodyCubit.getBodyExercises(
            dropDownMenuParams: DropDownMenuParams(
              day: selectedDay,
              week: selectedWeek,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is CalendarLoading) {
          return const TimerAndCalendarBase(
            child: CalendarShimmer(),
          );
        }
        if (state is CalendarSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const TimerAndCalendarBase(
                  child: TimerAndCalendarToggleBlocBuilder(),
                ),
                exerciseBodyBlocBuilder,
              ],
            ),
          );
        }
        if (state is CalendarFailure) {
          customSnackBar(context, state.errorMessage);
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
