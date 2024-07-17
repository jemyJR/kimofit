import 'package:flutter/material.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/home_cardio_plan/ui/widgets/home_cardio_plan_exercise_data_bloc_listener.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/home_cardio_day_bloc_builder.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/home_cardio_week_bloc_builder.dart';
import 'package:kimofit/generated/l10n.dart';

class DayAndWeekRow extends StatelessWidget {
  const DayAndWeekRow({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeCardioPlanExerciseBlocListener(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildColumn(
            label: S.of(context).dayNamber,
            child: const HomeCardioDayBlocBuilder(),
          ),
          _buildColumn(
            label: S.of(context).weekNamber,
            child: const HomeCardioWeekBlocBuilder(),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn({
    required String label,
    required Widget child,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyles.font15White,
        ),
        verticalSpace(2),
        child,
      ],
    );
  }
}
