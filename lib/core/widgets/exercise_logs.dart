import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';

enum ExerciseLogsType { reps, sets, weight, duration }

class ExerciseLogs extends StatelessWidget {
  const ExerciseLogs({
    super.key,
    required this.exercise,
    this.isSmall = false,
  });

  final dynamic exercise;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final exerciseLog = _generateExerciseLog(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (exerciseLog.isNotEmpty)
            _buildRowWithDividers(
              exerciseLog.take(2).toList(),
            ),
          if (exerciseLog.length > 2)
            Column(
              children: [
                verticalSpace(10),
                _buildRowWithDividers(exerciseLog.skip(2).toList()),
              ],
            ),
        ],
      ),
    );
  }

  List<Widget> _generateExerciseLog(BuildContext context) {
    return [
      if (exercise.reps != null)
        _buildLogTypeRow(context, ExerciseLogsType.reps),
      if (exercise.sets != null)
        _buildLogTypeRow(context, ExerciseLogsType.sets),
      if (exercise.weight != null)
        _buildLogTypeRow(context, ExerciseLogsType.weight),
      if (exercise.duration != null)
        _buildLogTypeRow(context, ExerciseLogsType.duration),
    ];
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
    final List<Widget> withDividers = [];
    for (int i = 0; i < widgets.length; i++) {
      withDividers.add(widgets[i]);
      if (i < widgets.length - 1) {
        withDividers.add(_buildVerticalDivider());
      }
    }
    return withDividers;
  }

  Widget _buildVerticalDivider() {
    return const VerticalDivider(
      color: ColorsManager.yellow,
      thickness: 2,
    );
  }

  Widget _buildLogTypeRow(BuildContext context, ExerciseLogsType logType) {
    final iconData = _getIconData(logType);
    final text = _getLogText(context, logType);
    final width = MediaQuery.of(context).size.width;
    final minWidth = isSmall ? width / 4 : width / 2 - 40.w;

    return Container(
      constraints: BoxConstraints(minWidth: minWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: ColorsManager.yellow,
            size: isSmall ? 15.sp : 20.sp,
          ),
          isSmall ? horizontalSpace(5) : horizontalSpace(20),
          Text(
            text,
            style: isSmall ? TextStyles.font12White : TextStyles.font15White,
          ),
        ],
      ),
    );
  }

  IconData _getIconData(ExerciseLogsType logType) {
    switch (logType) {
      case ExerciseLogsType.reps:
        return Icons.wifi_protected_setup_sharp;
      case ExerciseLogsType.sets:
        return Icons.repeat;
      case ExerciseLogsType.weight:
        return Icons.fitness_center;
      case ExerciseLogsType.duration:
        return Icons.timer;
    }
  }

  String _getLogText(BuildContext context, ExerciseLogsType logType) {
    switch (logType) {
      case ExerciseLogsType.reps:
        return "${exercise.reps} ${S.of(context).reps}";
      case ExerciseLogsType.sets:
        return "${exercise.sets} ${S.of(context).sets}";
      case ExerciseLogsType.weight:
        return "${exercise.weight} ${S.of(context).kg} ${S.of(context).weight}";
      case ExerciseLogsType.duration:
        return exercise.duration!;
    }
  }
}
