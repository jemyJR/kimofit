import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/widgets/custom_rounded_network_image.dart';
import 'package:kimofit/core/widgets/hero_animation.dart';

class WorkoutExerciseBaseBody extends StatelessWidget {
  const WorkoutExerciseBaseBody({
    super.key,
    required this.exercise,
    this.isGroupExercise = false,
    required this.child,
  });
  final dynamic exercise;
  final bool isGroupExercise;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isGroupExercise
          ? EdgeInsets.only(bottom: 10.h)
          : EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
      child: GestureDetector(
        onTap: () => context.pushNamed(
          Routes.workoutExercisesDetailsScreen,
          arguments: exercise,
        ),
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: ColorsManager.dark,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeroAnimation(
                  tag: exercise.id.toString(),
                  child: CustomRoundedNetworkImage(
                    height: 100.h,
                    width: 80.w,
                    imageUrl: exercise.image,
                  ),
                ),
                horizontalSpace(10),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
