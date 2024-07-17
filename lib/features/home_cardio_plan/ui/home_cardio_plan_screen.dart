import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/home_cardio_plan/ui/widgets/home_cardio_plan_exercise_data_bloc_builder.dart';
import 'package:kimofit/features/timer_and_calender/ui/timer_and_calender.dart';

class HomeCardioPlanScreen extends StatelessWidget {
  final String title;

  const HomeCardioPlanScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: title,
      ),
      //TODO: Handle when the training plan is empty
      body: const Column(
        children: [
          TimerAndCalender(),
          HomeCardioPlanExerciseBlocBuilder(),
        ],
      ),
    );
  }
}
