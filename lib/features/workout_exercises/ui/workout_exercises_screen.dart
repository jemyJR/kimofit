import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/timer_and_calender/ui/timer_and_calender_base.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender_shimmer.dart';

class WorkoutExercisesScreen extends StatelessWidget {
  const WorkoutExercisesScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: title,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TimerAndCalenderBase(
              child: CalenderShimmer(),
            ),
          ],
        ),
      ),
    );
  }
}
