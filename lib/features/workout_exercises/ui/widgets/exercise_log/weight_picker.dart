import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_button.dart';
import 'package:kimofit/features/workout_exercises/logic/cubit/exercise_log_cubit.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightPicker extends StatefulWidget {
  const WeightPicker({
    super.key,
    required this.weightType,
    required this.exisitingWeight,
  });

  final String weightType;
  final String exisitingWeight;

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  late List<double> weights;
  late int currentIndex;

  List<double> getWeights(String weightType) {
    switch (weightType) {
      case Constants.weightTypeFreeWeights:
        return List<double>.generate(20, (index) => (index + 1) * 2.5);

      case Constants.weightTypePlateWeights:
        return List<double>.generate(29, (index) => 1.0 + (index * 0.5));
      default:
        return [];
    }
  }

  @override
  void initState() {
    super.initState();
    weights = getWeights(widget.weightType);
    double existingWeightValue = double.tryParse(widget.exisitingWeight) ?? 0.0;
    currentIndex = weights.indexOf(existingWeightValue);
    currentIndex = (currentIndex != -1) ? currentIndex : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: ColorsManager.dark,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.remove,
                    size: 24.sp,
                    color: ColorsManager.yellow,
                  ),
                  onPressed: () => setState(() {
                    final newIndex = currentIndex - 1;
                    currentIndex = newIndex.clamp(0, weights.length - 1);
                  }),
                ),
                NumberPicker(
                  value: currentIndex,
                  minValue: 0,
                  maxValue: weights.length - 1,
                  itemHeight: 60.h,
                  itemWidth: 60.w,
                  axis: Axis.horizontal,
                  textStyle: TextStyles.font18Gray,
                  selectedTextStyle: TextStyles.font22White,
                  onChanged: (index) => setState(() => currentIndex = index),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: ColorsManager.blue,
                    ),
                  ),
                  textMapper: (numberText) =>
                      '${weights[int.parse(numberText)].toFormattedNumber()}',
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 24.sp,
                    color: ColorsManager.yellow,
                  ),
                  onPressed: () => setState(() {
                    final newIndex = currentIndex + 1;
                    currentIndex = newIndex.clamp(0, weights.length - 1);
                  }),
                ),
              ],
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.w),
            child: CustomButton(
              text: S.of(context).chooseWeight,
              textStyle: TextStyles.font18White,
              backgroundColor: ColorsManager.blue,
              onPressed: () {
                print(weights[currentIndex]);
                context.read<ExerciseLogCubit>().showTable();
              },
            ),
          ),
        ],
      ),
    );
  }
}
