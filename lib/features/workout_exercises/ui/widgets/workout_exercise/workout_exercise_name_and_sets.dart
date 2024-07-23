import 'package:flutter/material.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';

class WorkoutExerciseNameAndSets extends StatelessWidget {
  const WorkoutExerciseNameAndSets({
    super.key,
    required this.name,
    required this.sets,
  });

  final String name;
  final String sets;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              name,
              style: TextStyles.font18White,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),
          verticalSpace(5),
          Row(
            children: [
              Text(
                sets,
                style: TextStyles.font15White,
              ),
              horizontalSpace(5),
              Text(
                S.of(context).sets,
                style: TextStyles.font15Blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
