import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/home_cardio_plan/ui/widgets/day_and_week_row.dart';
import 'package:kimofit/features/home_cardio_plan/ui/widgets/timer_and_calender_button.dart';

class TimerAndCalender extends StatelessWidget {
  const TimerAndCalender({
    super.key,
    required this.days,
    required this.weeks,
  });
  final List<LocalizedField> days;
  final List<LocalizedField> weeks;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Container(
        height: 140.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 115.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsManager.dark,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            Column(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: TimerAndCalenderButton(
                    iconPath: Assets.animationCalendar,
                  ),
                ),
                DayAndWeekRow(days: days, weeks: weeks),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
