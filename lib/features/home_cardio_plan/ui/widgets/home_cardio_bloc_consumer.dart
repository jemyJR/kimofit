import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/features/home_cardio_plan/logic/home_cardio_calender_cubit/home_cardio_calender_cubit.dart';
import 'package:kimofit/features/home_cardio_plan/logic/home_cardio_plan_cubit/home_cardio_plan_cubit.dart';
import 'package:kimofit/features/home_cardio_plan/ui/widgets/home_cardio_calender_row_bloc_builder.dart';
import 'package:kimofit/features/home_cardio_plan/ui/widgets/home_cardio_plan_exercise_data_bloc_builder.dart';
import 'package:kimofit/features/timer_and_calender/data/calender_list.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender_shimmer.dart';
import 'package:kimofit/features/timer_and_calender/ui/timer_and_calender_base.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/timer_and_calender_toggle_bloc_builder.dart';

class HomeCardioBlocConsumer extends StatelessWidget {
  const HomeCardioBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCardioCalenderCubit, HomeCardioCalenderState>(
      listener: (context, state) {
        final cubit = context.read<HomeCardioPlanCubit>();
        if (state is HomeCardioCalenderSuccess) {
          final selectedDay = state.selectedDay;
          final selectedWeek = state.selectedWeek;

          if (selectedDay.en == restDay.en) {
            cubit.type = HomeCardioPlanExerciseStatus.restDay;
          } else if (selectedDay.en == notFoundDay.en) {
            cubit.type = HomeCardioPlanExerciseStatus.notFoundDay;
          } else {
            cubit.type = HomeCardioPlanExerciseStatus.normalDay;
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
        if (state is HomeCardioCalenderLoading) {
          return const TimerAndCalenderBase(
            child: CalenderShimmer(),
          );
        }
        if (state is HomeCardioCalenderSuccess) {
          return const Column(
            children: [
              TimerAndCalenderBase(
                child: TimerAndCalenderToggleBlocBuilder(
                  calenderRowBlocBuilder: HomeCardioCalenderRowBlocBuilder(),
                ),
              ),
              HomeCardioPlanExerciseBlocBuilder(),
            ],
          );
        }
        if (state is HomeCardioCalenderFailure) {
          customSnackBar(context, state.errorMessage);
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
