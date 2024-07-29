import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_log_model.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/exercise_log/exercise_log_buttom_sheet.dart';
import 'package:kimofit/generated/l10n.dart';

class ShowExerciseLog extends StatelessWidget {
  const ShowExerciseLog({
    super.key,
    required this.name,
    required this.id,
    required this.logs,
    required this.weightType,
  });

  final String name;
  final int id;
  final List<WorkoutExerciseLogModel> logs;
  final String weightType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => exerciseBottomSheet(
        context: context,
        name: name,
        id: id,
        logs: logs,
        weightType: weightType,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            S.of(context).exerciseLog,
            style: TextStyles.font15BlueBold,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: ColorsManager.blue,
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}
