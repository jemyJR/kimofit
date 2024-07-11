import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/networking/params/drop_down_menu_params.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/timer_and_calender/logic/timer_and_calender_cubit.dart';
import 'package:kimofit/features/timer_and_calender/ui/timer_and_calender.dart';

class HomeCardioPlanScreen extends StatelessWidget {
  const HomeCardioPlanScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerAndCalenderCubit()..getInitParams(),
      child: Scaffold(
        backgroundColor: ColorsManager.bgDark,
        appBar: CustomAppBar(
          title: title,
        ),
        body: BlocBuilder<TimerAndCalenderCubit, TimerAndCalenderState>(
          builder: (context, state) {
            final cubit = context.read<TimerAndCalenderCubit>();

            if (state is DropDownparamsUpdated) {
              return Column(
                children: [
                  TimerAndCalender(
                    days: cubit.days,
                    weeks: cubit.weeks,
                  ),
                  columText(state.initParams),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

Widget columText(DropDownMenuParams initParams) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'selected day: ${initParams.day}',
        style: TextStyles.font18White,
      ),
      Text(
        'selected week: ${initParams.week}',
        style: TextStyles.font18White,
      ),
    ],
  );
}
