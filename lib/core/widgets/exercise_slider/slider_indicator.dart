import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({
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
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: indicatorScrollController,
        child: AnimatedSmoothIndicator(
          onDotClicked: (int index) => controller.animateToPage(index),
          effect: const ExpandingDotsEffect(
            expansionFactor: 2,
            spacing: 8.0,
            radius: 16.0,
            dotWidth: 10.0,
            dotHeight: 10.0,
            dotColor: ColorsManager.gray,
            activeDotColor: ColorsManager.blue,
          ),
          activeIndex: currentSlideIndex,
          count: sliderLength,
        ),
      ),
    );
  }
}
