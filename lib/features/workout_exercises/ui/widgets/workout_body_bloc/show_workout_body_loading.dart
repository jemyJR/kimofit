import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/app/ui/kimofit_app.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/home/ui/widgets/home_shimmer/shimmer_normal.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/title_with_content.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise_name_and_sets.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

class ShowWorkoutBodyLoading extends StatelessWidget {
  const ShowWorkoutBodyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.dark,
      highlightColor: ColorsManager.gray,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWithContent(
              title: S.of(context).warmUpExercises,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                child: ShimmerNormal(height: 100.h, width: double.infinity),
              ),
            ),
            TitleWithContent(
              title: S.of(context).workoutExercises,
              child: basicListView(),
            ),
            TitleWithContent(
              title: S.of(context).absExercises,
              child: basicListView(),
            ),
            TitleWithContent(
              title: S.of(context).cardioExercises,
              child: basicListView(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget basicListView() {
  return ListView.builder(
    itemCount: 3,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      return _exerciseContainer();
    },
  );
}

Widget _exerciseContainer() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
    child: Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: ColorsManager.dark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WorkoutExerciseNameAndSets(
                        name: S.of(contextGlobal).exercise,
                        sets: '5',
                      ),
                      horizontalSpace(10),
                      Icon(
                        Icons.info,
                        size: 25.sp,
                        color: ColorsManager.white,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        S.of(contextGlobal).exerciseLog,
                        style: TextStyles.font15BlueBold,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ColorsManager.blue,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
