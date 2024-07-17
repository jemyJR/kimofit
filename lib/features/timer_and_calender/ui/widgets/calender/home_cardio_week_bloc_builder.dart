import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/features/timer_and_calender/data/calender_list.dart';
import 'package:kimofit/features/timer_and_calender/logic/timer_and_calender_cubit.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/custom_dropdown.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/custom_dropdown_shimmer.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/dropdown_menu_container_shimmer.dart';

class HomeCardioWeekBlocBuilder extends StatelessWidget {
  const HomeCardioWeekBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerAndCalenderCubit, TimerAndCalenderState>(
      builder: (context, state) {
        if (state is TimerAndCalenderLoaded) {
          return CustomDropdown(
            list: weeks,
            selectedValue: state.selectedWeek,
            onChanged: (newWeek) {
              if (newWeek != null) {
                context.read<TimerAndCalenderCubit>().selectWeek(newWeek);
              }
            },
          );
        } else {
          return const CustomDropdownShimmer(type: ShimmerType.week);
        }
      },
    );
  }
}
