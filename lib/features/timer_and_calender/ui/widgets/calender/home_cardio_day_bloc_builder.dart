import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:kimofit/features/home_cardio_plan/logic/home_cardio_plan_cubit.dart';
import 'package:kimofit/features/timer_and_calender/logic/timer_and_calender_cubit.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/custom_dropdown.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/custom_dropdown_shimmer.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/dropdown_menu_container_shimmer.dart';

class HomeCardioDayBlocBuilder extends StatelessWidget {
  const HomeCardioDayBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerAndCalenderCubit, TimerAndCalenderState>(
      builder: (context, state) {
        TimerAndCalenderCubit cubit = context.read<TimerAndCalenderCubit>();

        if (state is TimerAndCalenderLoaded) {
          return CustomDropdown(
            list: state.days,
            selectedValue: state.selectedDay,
            onChanged: (newDay) {
              if (newDay != null) {
                cubit.selectDay(newDay);
                context.read<HomeCardioPlanCubit>().getHomeCardioPlanExercises(
                      dropDownMenuParams: DropDownMenuParams(
                        day: newDay.id,
                        week: state.selectedWeek.id,
                      ),
                    );
              }
            },
          );
        } else {
          return const CustomDropdownShimmer(type: ShimmerType.day);
        }
      },
    );
  }
}
