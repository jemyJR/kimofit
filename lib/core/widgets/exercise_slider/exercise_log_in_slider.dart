import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';

enum ExerciseLogInSliderType { reps, sets, weight, duration }

class ExerciseLogInSlider extends StatelessWidget {
  const ExerciseLogInSlider({super.key, required this.exercise});
  final dynamic exercise;

  @override
  Widget build(BuildContext context) {
    List<Widget> exerciseLog = _generateExerciseLog(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (exerciseLog.isNotEmpty)
          _buildRowWithDividers(exerciseLog.sublist(
              0, exerciseLog.length >= 2 ? 2 : exerciseLog.length)),
        if (exerciseLog.length > 2) ...[
          verticalSpace(10),
          _buildRowWithDividers(exerciseLog.sublist(2)),
        ],
      ],
    );
  }

  List<Widget> _generateExerciseLog(BuildContext context) {
    List<Widget> exerciseLog = [];
    if (exercise.reps != null) {
      exerciseLog.add(_buildLogTypeRow(context, ExerciseLogInSliderType.reps));
    }
    if (exercise.sets != null) {
      exerciseLog.add(_buildLogTypeRow(context, ExerciseLogInSliderType.sets));
    }
    if (exercise.weight != null) {
      exerciseLog
          .add(_buildLogTypeRow(context, ExerciseLogInSliderType.weight));
    }
    if (exercise.duration != null) {
      exerciseLog
          .add(_buildLogTypeRow(context, ExerciseLogInSliderType.duration));
    }
    return exerciseLog;
  }

  Widget _buildRowWithDividers(List<Widget> widgets) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _addVerticalDividers(widgets),
      ),
    );
  }

  List<Widget> _addVerticalDividers(List<Widget> widgets) {
    List<Widget> withDividers = [];
    for (int i = 0; i < widgets.length; i++) {
      withDividers.add(widgets[i]);
      if (i < widgets.length - 1) {
        withDividers.add(
          const VerticalDivider(
            color: ColorsManager.yellow,
            thickness: 2,
          ),
        );
      }
    }
    return withDividers;
  }

  Widget _buildLogTypeRow(
      BuildContext context, ExerciseLogInSliderType logType) {
    IconData iconData;
    String text;

    switch (logType) {
      case ExerciseLogInSliderType.reps:
        iconData = Icons.wifi_protected_setup_sharp;
        text = "${exercise.reps} ${S.of(context).reps}";
        break;
      case ExerciseLogInSliderType.sets:
        iconData = Icons.repeat;
        text = "${exercise.sets} ${S.of(context).sets}";
        break;
      case ExerciseLogInSliderType.weight:
        iconData = Icons.fitness_center;
        text = "${exercise.weight} ${S.of(context).kg} ${S.of(context).weight}";
        break;
      case ExerciseLogInSliderType.duration:
        iconData = Icons.timer;
        text = exercise.duration!;
        break;
    }

    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: ColorsManager.yellow,
            size: 20.sp,
          ),
          horizontalSpace(10),
          Text(
            text,
            style: TextStyles.font15White,
          ),
        ],
      ),
    );
  }
}
