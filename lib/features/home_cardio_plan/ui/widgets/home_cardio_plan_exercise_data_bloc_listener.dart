import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:kimofit/features/home_cardio_plan/logic/home_cardio_plan_cubit.dart';
import 'package:kimofit/features/timer_and_calender/logic/timer_and_calender_cubit.dart';

class HomeCardioPlanExerciseBlocListener extends StatelessWidget {
  const HomeCardioPlanExerciseBlocListener({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerAndCalenderCubit, TimerAndCalenderState>(
      listener: (context, state) {
        if (state is TimerAndCalenderLoaded) {
          final selectedDay = state.selectedDay;
          final selectedWeek = state.selectedWeek;
          context.read<HomeCardioPlanCubit>().getHomeCardioPlanExercises(
                dropDownMenuParams: DropDownMenuParams(
                  day: selectedDay.id,
                  week: selectedWeek.id,
                ),
              );
        }
      },
      child: child,
    );
  }
}
