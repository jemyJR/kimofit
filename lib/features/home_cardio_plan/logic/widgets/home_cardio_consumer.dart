import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/features/home_cardio_plan/data/enums/exercise_status_enum.dart';
import 'package:kimofit/features/home_cardio_plan/logic/home_cardio_calendar_cubit/home_cardio_calendar_cubit.dart';
import 'package:kimofit/features/home_cardio_plan/logic/home_cardio_plan_cubit/home_cardio_plan_cubit.dart';
import 'package:kimofit/features/home_cardio_plan/logic/widgets/home_cardio_calendar_row_bloc_builder.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/widgets/home_cardio_plan_exercise_data_bloc_builder.dart';
import 'package:kimofit/features/timer_and_calendar/data/calendar_list.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/calendar_shimmer.dart';
import 'package:kimofit/features/timer_and_calendar/ui/timer_and_calendar_base.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/timer_and_calendar_toggle_bloc_builder.dart';

class HomeCardioBlocConsumer extends StatelessWidget {
  const HomeCardioBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCardioCalendarCubit, HomeCardioCalendarState>(
      listener: (context, state) {
        final cubit = context.read<HomeCardioPlanCubit>();
        if (state is HomeCardioCalendarSuccess) {
          final selectedDay = state.selectedDay;
          final selectedWeek = state.selectedWeek;

          if (selectedDay.en == restDay.en) {
            cubit.type = ExerciseStatus.restDay;
          } else if (selectedDay.en == notFoundDay.en) {
            cubit.type = ExerciseStatus.notFoundDay;
          } else {
            cubit.type = ExerciseStatus.normalDay;
          }

          context.read<HomeCardioPlanCubit>().getHomeCardioPlanExercises(
                dropDownMenuParams: DropDownMenuParams(
                  day: selectedDay,
                  week: selectedWeek,
                ),
              );
        }
      },
      builder: (context, state) {
        if (state is HomeCardioCalendarLoading) {
          return const TimerAndCalendarBase(
            child: CalendarShimmer(),
          );
        }
        if (state is HomeCardioCalendarSuccess) {
          return const Column(
            children: [
              TimerAndCalendarBase(
                child: TimerAndCalendarToggleBlocBuilder(
                  calendarRowBlocBuilder: HomeCardioCalendarRowBlocBuilder(),
                ),
              ),
              HomeCardioPlanExerciseBlocBuilder(),
            ],
          );
        }
        if (state is HomeCardioCalendarFailure) {
          customSnackBar(context, state.errorMessage);
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
