import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_log_model.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise/exercise_log/exercise_log_header.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise/exercise_log/exercise_log_table.dart';
import 'package:kimofit/generated/l10n.dart';

void exerciseBottomSheet(
  BuildContext context,
  String name,
  List<WorkoutExerciseLogModel> logs,
) {
  showModalBottomSheet(
    isDismissible: false,
    backgroundColor: ColorsManager.bgDark,
    context: context,
    builder: (context) => Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ExerciseLogHeader(),
            verticalSpace(10),
            Text(
              name,
              style: TextStyles.font18White,
            ),
            verticalSpace(10),
            Text(
              '${logs.length} ${S.of(context).sets}',
              style: TextStyles.font15White,
            ),
            ExerciseLogTable(logs: logs),
            verticalSpace(50),
          ],
        ),
      ),
    ),
  );
}
