// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kimofit/core/constants/colors.dart';
// import 'package:kimofit/core/helpers/extensions.dart';
// import 'package:kimofit/core/theming/style.dart';
// import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_log_model.dart';
// import 'package:kimofit/features/workout_exercises/logic/cubit/exercise_log_cubit.dart';
// import 'package:kimofit/generated/l10n.dart';

// class ExerciseLogTable extends StatelessWidget {
//   const ExerciseLogTable({
//     super.key,
//     required this.logs,
//   });

//   final List<WorkoutExerciseLogModel> logs;

//   @override
//   Widget build(BuildContext context) {
//     final double firstColumnWidth = 100.w;
//     final double cellWidth = 50.w;

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10.r),
//           child: Table(
//             columnWidths: {
//               0: FixedColumnWidth(firstColumnWidth),
//               for (int i = 1; i <= logs.length; i++)
//                 i: FixedColumnWidth(cellWidth),
//             },
//             border: TableBorder.all(
//               width: 1.w,
//               color: ColorsManager.blue,
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             children: [
//               _buildTableRow(
//                 context: context,
//                 label: S.of(context).sets,
//                 values: logs.map((log) => '${log.sets}'),
//                 isSets: true,
//               ),
//               _buildTableRow(
//                 context: context,
//                 label: S.of(context).reps,
//                 values: logs.map((log) => '${log.reps}'),
//               ),
//               _buildTableRow(
//                 context: context,
//                 label: S.of(context).weight,
//                 values: logs.map((log) => '${log.weight.toFormattedNumber()}'),
//                 isWeight: true,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   TableRow _buildTableRow({
//     required BuildContext context,
//     required String label,
//     required Iterable<String> values,
//     bool isSets = false,
//     bool isWeight = false,
//   }) {
//     final List<Widget> cells = [
//       _buildCell(value: label, isHeader: true),
//     ];

//     for (final value in values) {
//       cells.add(
//         isWeight
//             ? _buildClickableCell(context: context, value: value)
//             : _buildCell(value: value, isHeader: isSets),
//       );
//     }

//     return TableRow(
//       children: cells,
//     );
//   }

//   Widget _buildCell({
//     required String value,
//     bool isHeader = false,
//   }) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
//       color: isHeader ? ColorsManager.blue : null,
//       child: Center(
//         child: Text(
//           value,
//           style: isHeader ? TextStyles.font18WhiteBold : TextStyles.font15White,
//         ),
//       ),
//     );
//   }

//   Widget _buildClickableCell({
//     required BuildContext context,
//     required String value,
//     bool isHeader = false,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         BlocProvider.of<ExerciseLogCubit>(context).showWeightPicker(value);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
//         decoration: BoxDecoration(
//           color: isHeader ? ColorsManager.blue : null,
//         ),
//         child: Center(
//           child: Text(
//             value,
//             style:
//                 isHeader ? TextStyles.font18WhiteBold : TextStyles.font15White,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_log_model.dart';
import 'package:kimofit/features/workout_exercises/logic/cubit/exercise_log_cubit.dart';
import 'package:kimofit/generated/l10n.dart';

class ExerciseLogTable extends StatelessWidget {
  const ExerciseLogTable({
    super.key,
    required this.logs,
  });

  final List<WorkoutExerciseLogModel> logs;

  @override
  Widget build(BuildContext context) {
    final double firstColumnWidth = 100.w;
    final double cellWidth = 50.w;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Table(
            columnWidths: {
              0: FixedColumnWidth(firstColumnWidth),
              for (int i = 1; i <= logs.length; i++)
                i: FixedColumnWidth(cellWidth),
            },
            border: TableBorder.all(
              width: 1.w,
              color: ColorsManager.blue,
              borderRadius: BorderRadius.circular(10.r),
            ),
            children: [
              _buildTableRow(
                context: context,
                label: S.of(context).sets,
                values: logs.map((log) => '${log.sets}'),
                isSets: true,
              ),
              _buildTableRow(
                context: context,
                label: S.of(context).reps,
                values: logs.map((log) => '${log.reps}'),
              ),
              _buildTableRow(
                context: context,
                label: S.of(context).weight,
                values: logs.map((log) => '${log.weight.toFormattedNumber()}'),
                isWeight: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow({
    required BuildContext context,
    required String label,
    required Iterable<String> values,
    bool isSets = false,
    bool isWeight = false,
  }) {
    final List<Widget> cells = [
      _buildCell(value: label, isHeader: true),
    ];

    int index = 0;
    for (final value in values) {
      cells.add(
        isWeight
            ? _buildClickableCell(
                context: context, value: value, index: index++)
            : _buildCell(value: value, isHeader: isSets),
      );
    }

    return TableRow(
      children: cells,
    );
  }

  Widget _buildCell({
    required String value,
    bool isHeader = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      color: isHeader ? ColorsManager.blue : null,
      child: Center(
        child: Text(
          value,
          style: isHeader ? TextStyles.font18WhiteBold : TextStyles.font15White,
        ),
      ),
    );
  }

  Widget _buildClickableCell({
    required BuildContext context,
    required String value,
    required int index,
    bool isHeader = false,
  }) {
    return GestureDetector(
      onTap: () {
        print('Weight index clicked: $index');
        BlocProvider.of<ExerciseLogCubit>(context).showWeightPicker(value);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isHeader ? ColorsManager.blue : null,
        ),
        child: Center(
          child: Text(
            value,
            style:
                isHeader ? TextStyles.font18WhiteBold : TextStyles.font15White,
          ),
        ),
      ),
    );
  }
}
