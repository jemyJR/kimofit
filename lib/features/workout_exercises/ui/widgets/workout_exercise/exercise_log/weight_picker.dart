import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_button.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:numberpicker/numberpicker.dart';

enum WeightType {
  freeWeights,
  plateWeights,
}

List<double> getWeights(WeightType weightType) {
  switch (weightType) {
    case WeightType.freeWeights:
      return List<double>.generate(20, (index) => (index + 1) * 2.5);

    case WeightType.plateWeights:
      return List<double>.generate(29, (index) => 1.0 + (index * 0.5));
    default:
      return [];
  }
}

class WeightPicker extends StatefulWidget {
  const WeightPicker({
    super.key,
    required this.weightType,
  });

  final WeightType weightType;

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  late List<double> weights;
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    weights = getWeights(widget.weightType);
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
                    final newIndex = _currentIndex - 1;
                    _currentIndex = newIndex.clamp(0, weights.length - 1);
                  }),
                ),
                NumberPicker(
                  value: _currentIndex,
                  minValue: 0,
                  maxValue: weights.length - 1,
                  itemHeight: 60.h,
                  itemWidth: 60.w,
                  axis: Axis.horizontal,
                  textStyle: TextStyles.font18Gray,
                  selectedTextStyle: TextStyles.font22White,
                  onChanged: (index) => setState(() => _currentIndex = index),
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
                    final newIndex = _currentIndex + 1;
                    _currentIndex = newIndex.clamp(0, weights.length - 1);
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
                print(weights[_currentIndex]);
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
