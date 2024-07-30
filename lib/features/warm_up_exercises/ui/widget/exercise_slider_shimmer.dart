import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/exercise_logs.dart';
import 'package:kimofit/features/home/ui/widgets/home_shimmer/shimmer_with_text.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_exercise_model.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExerciseSliderShimmer extends StatelessWidget {
  const ExerciseSliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.dark,
      highlightColor: ColorsManager.gray,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "${S.of(context).exerciseNo} ( 1/5 )",
              style: TextStyles.font22Blue,
            ),
            verticalSpace(15),
            _sliderBuilder(),
            verticalSpace(15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _arrowWithContainer(Icons.arrow_back),
                  horizontalSpace(10),
                  _indicator(),
                  horizontalSpace(10),
                  _arrowWithContainer(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _indicator() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: AnimatedSmoothIndicator(
      onDotClicked: (int index) {},
      effect: const ExpandingDotsEffect(
        expansionFactor: 2,
        spacing: 8.0,
        radius: 16.0,
        dotWidth: 10.0,
        dotHeight: 10.0,
        dotColor: ColorsManager.gray,
        activeDotColor: ColorsManager.blue,
      ),
      activeIndex: 0,
      count: 5,
    ),
  );
}

Widget _sliderBuilder() {
  return CarouselSlider.builder(
    itemCount: 5,
    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
      final exercise = WarmUpExerciseModel(
        gifPath: '',
        reps: 1,
        sets: 1,
        weight: 1,
        duration: '1 دقائق',
      );
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ShimmerWithText(
              height: 150.h,
              width: double.infinity,
              text: S.of(context).exercise,
              textStyle: TextStyles.font32BoldWhite.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          verticalSpace(10),
          SizedBox(
            height: 70.h,
            child: ExerciseLogs(exercise: exercise),
          ),
        ],
      );
    },
    options: CarouselOptions(
      enlargeCenterPage: true,
      aspectRatio: 13 / 10,
      enableInfiniteScroll: false,
    ),
  );
}

Widget _arrowWithContainer(icon) {
  return Container(
    width: 50.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: ColorsManager.blue.withOpacity(0.2),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Center(
      child: Icon(
        icon,
        color: ColorsManager.white,
      ),
    ),
  );
}
