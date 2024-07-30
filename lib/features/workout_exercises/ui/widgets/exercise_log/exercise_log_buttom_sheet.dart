import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_log_model.dart';
import 'package:kimofit/features/workout_exercises/logic/cubit/exercise_log_cubit.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/exercise_log/exercise_log_header.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/exercise_log/exercise_log_table.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/exercise_log/weight_picker.dart';
import 'package:kimofit/generated/l10n.dart';

void exerciseBottomSheet({
  required BuildContext context,
  required final String name,
  required final int id,
  required final List<WorkoutExerciseLogModel> logs,
  required final String weightType,
}) {
  showModalBottomSheet(
    isDismissible: false,
    backgroundColor: ColorsManager.bgDark,
    context: context,
    builder: (context) => BlocProvider(
      create: (_) => ExerciseLogCubit(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ExerciseLogHeader(),
              verticalSpace(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    name,
                    style: TextStyles.font18White,
                  ),
                ),
              ),
              BlocBuilder<ExerciseLogCubit, ExerciseLogState>(
                builder: (context, state) {
                  if (state is ExerciseLogTableState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        verticalSpace(10),
                        Text(
                          '${logs.length} ${S.of(context).sets}',
                          style: TextStyles.font15White,
                        ),
                        ExerciseLogTable(logs: logs),
                      ],
                    );
                  } else if (state is ExerciseWeightPickerState) {
                    return WeightPicker(
                      weightType: weightType,
                      exisitingWeight: state.existingWeight,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              verticalSpace(50),
            ],
          ),
        ),
      ),
    ),
  );
}
