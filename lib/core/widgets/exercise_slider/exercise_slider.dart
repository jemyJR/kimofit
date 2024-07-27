import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_rounded_network_image.dart';
import 'package:kimofit/features/home/ui/widgets/home_shimmer/shimmer_with_text.dart';
import 'package:kimofit/core/widgets/exercise_slider/arrow_buttons_and_indicator.dart';
import 'package:kimofit/core/widgets/exercise_logs.dart';
import 'package:kimofit/generated/l10n.dart';

class ExerciseSlider extends StatefulWidget {
  const ExerciseSlider({super.key, required this.exercises});
  final List<dynamic> exercises;

  @override
  State<ExerciseSlider> createState() => _ExerciseSliderState();
}

class _ExerciseSliderState extends State<ExerciseSlider> {
  final CarouselController controller = CarouselController();
  final ScrollController indicatorScrollController = ScrollController();
  int currentSlideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "${S.of(context).exerciseNo} ( ${currentSlideIndex + 1}/${widget.exercises.length} )",
            style: TextStyles.font22Blue,
          ),
          verticalSpace(15),
          CarouselSlider.builder(
            itemCount: widget.exercises.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              final exercise = widget.exercises[itemIndex];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _sliderImge(exercise.gifPath),
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
              onPageChanged: (index, reason) {
                setState(
                  () => currentSlideIndex = index,
                );
                scrollToCurrentDot(isNext: index > currentSlideIndex);
              },
            ),
            carouselController: controller,
          ),
          verticalSpace(15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: ArrowButtonsAndIndicator(
              controller: controller,
              indicatorScrollController: indicatorScrollController,
              currentSlideIndex: currentSlideIndex,
              sliderLength: widget.exercises.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sliderImge(gifPath) {
    return Expanded(
      child: CustomRoundedNetworkImage(
        imageUrl: gifPath,
        height: 150.h,
        width: double.infinity,
        placeholder: ShimmerWithText(
          height: 150.h,
          width: double.infinity,
          text: S.of(context).exercise,
          textStyle: TextStyles.font32BoldWhite.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  //scroll to current dot
  void scrollToCurrentDot({required bool isNext}) {
    double scrollToPosition = (currentSlideIndex * 8);
    if (isNext &&
        scrollToPosition > indicatorScrollController.position.maxScrollExtent) {
      scrollToPosition = indicatorScrollController.position.maxScrollExtent;
    } else if (!isNext &&
        scrollToPosition < indicatorScrollController.position.minScrollExtent) {
      scrollToPosition = indicatorScrollController.position.minScrollExtent;
    }
    indicatorScrollController.animateTo(
      scrollToPosition,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
