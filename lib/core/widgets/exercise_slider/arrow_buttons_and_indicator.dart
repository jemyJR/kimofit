import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/widgets/exercise_slider/arrow_slider_button.dart';
import 'package:kimofit/core/widgets/exercise_slider/slider_indicator.dart';

class ArrowButtonsAndIndicator extends StatelessWidget {
  const ArrowButtonsAndIndicator({
    super.key,
    required this.controller,
    required this.indicatorScrollController,
    required this.currentSlideIndex,
    required this.sliderLength,
  });
  final CarouselController controller;
  final ScrollController indicatorScrollController;
  final int currentSlideIndex;
  final int sliderLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ArrowSliderButton(
          onTap: () => controller.previousPage(),
          icon: Icons.arrow_back,
        ),
        horizontalSpace(10),
        SliderIndicator(
          controller: controller,
          indicatorScrollController: indicatorScrollController,
          currentSlideIndex: currentSlideIndex,
          sliderLength: sliderLength,
        ),
        horizontalSpace(10),
        ArrowSliderButton(
          onTap: () => controller.nextPage(),
          icon: Icons.arrow_forward,
        ),
      ],
    );
  }
}
