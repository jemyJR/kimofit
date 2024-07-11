// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:circular_countdown_timer/circular_countdown_timer.dart';
// import 'package:kimofit/core/constants/colors.dart';
// import 'package:kimofit/core/theming/style.dart';

// class CountDownTimer extends StatelessWidget {
//   const CountDownTimer({
//     super.key,
//     required this.duration,
//     required this.controller,
//     required this.onComplete,
//   });

//   final int duration;
//   final CountDownController controller;
//   final VoidCallback onComplete;

//   @override
//   Widget build(BuildContext context) {
//     return CircularCountDownTimer(
//       duration: duration,
//       initialDuration: 0,
//       controller: controller,
//       width: 75.w,
//       height: 75.h,
//       ringColor: ColorsManager.gray,
//       fillColor: ColorsManager.yellow,
//       backgroundColor: ColorsManager.blue,
//       strokeWidth: 10.0,
//       strokeCap: StrokeCap.round,
//       textStyle: TextStyles.font22White,
//       textFormat: CountdownTextFormat.MM_SS,
//       isReverse: true,
//       isReverseAnimation: true,
//       isTimerTextShown: true,
//       autoStart: false,
//       onComplete: onComplete,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({
    super.key,
    required this.duration,
    required this.controller,
    required this.onComplete,
  });

  final int duration;
  final CountDownController controller;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: duration,
      initialDuration: 0,
      controller: controller,
      width: 75.w,
      height: 75.h,
      ringColor: ColorsManager.gray,
      fillColor: ColorsManager.yellow,
      backgroundColor: ColorsManager.blue,
      strokeWidth: 10.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyles.font22White,
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: false,
      onComplete: onComplete,
    );
  }
}
