import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/core/widgets/no_data_widget_small.dart';
import 'package:kimofit/features/timer_and_calender/ui/timer_and_calender_base.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender_shimmer.dart';
import 'package:kimofit/features/workout_exercises/data/test_data.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/warmup_exercise_area.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/title_with_content.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise_area.dart';
import 'package:kimofit/generated/l10n.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TimerAndCalenderBase(
              child: CalenderShimmer(),
            ),
            TitleWithContent(
              title: S.of(context).warmUpExercises,
              child: WarmUpExerciseArea(
                warmUpExercise: workoutBodyResponse.warmUpExercise,
              ),
            ),
            TitleWithContent(
              title: S.of(context).workoutExercises,
              child: WorkoutExerciseArea(
                workoutExercise: workoutBodyResponse.workoutExercise,
              ),
            ),
            const NoDataWidgetSmall(),
          ],
        ),
      ),
    );
  }
}
