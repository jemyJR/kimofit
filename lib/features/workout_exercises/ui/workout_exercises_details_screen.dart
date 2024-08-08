import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/core/widgets/show_title_with_list.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercises_details_argument_model.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/image_and_video_slider.dart';
import 'package:kimofit/generated/l10n.dart';

class WorkoutExercisesDetailsScreen extends StatelessWidget {
  const WorkoutExercisesDetailsScreen({
    super.key,
    required this.args,
  });

  final WorkoutExercisesDetailsArgumentModel args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: args.exercise.name.getLocalizedText(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageAndVideoSlider(args: args),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
              child: ShowTitleWithList(
                title: S.of(context).exerciseDescription,
                list: args.exercise.description,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
