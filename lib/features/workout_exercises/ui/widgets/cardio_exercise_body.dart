import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/exercise_logs.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/notes_alert_dialog/show_notes_alert_dialog.dart';

class CardioExerciseBody extends StatelessWidget {
  const CardioExerciseBody({
    super.key,
    required this.exercise,
  });

  final dynamic exercise;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    exercise.name.getLocalizedText(),
                    style: TextStyles.font18White,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              horizontalSpace(10),
              exercise.notes.isNotEmpty
                  ? ShownotesAlertDialog(
                      notes: exercise.notes,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          verticalSpace(5),
          SizedBox(
            height: 45.h,
            child: ExerciseLogs(
              exercise: exercise,
              isSmall: true,
            ),
          ),
        ],
      ),
    );
  }
}
