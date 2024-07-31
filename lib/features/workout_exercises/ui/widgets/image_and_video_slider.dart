import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_rounded_network_image.dart';
import 'package:kimofit/core/widgets/hero_animation.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/exercise_video_player.dart';

class ImageAndVideoSlider extends StatefulWidget {
  final dynamic exerciseModel;

  const ImageAndVideoSlider({super.key, required this.exerciseModel});

  @override
  State<ImageAndVideoSlider> createState() => _ImageAndVideoSliderState();
}

class _ImageAndVideoSliderState extends State<ImageAndVideoSlider> {
  final PageController pageController = PageController();
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      int next = pageController.page!.round();
      if (currentPageIndex != next) {
        setState(() {
          currentPageIndex = next;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  List<Widget> getSliderItems(BuildContext context) {
    return [
      HeroAnimation(
        tag: widget.exerciseModel.id.toString(),
        child: CustomRoundedNetworkImage(
          height: 100.h,
          width: MediaQuery.of(context).size.width,
          imageUrl: widget.exerciseModel.image,
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ExerciseVideoPlayer(exerciseModel: widget.exerciseModel),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> sliderItems = getSliderItems(context);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: sliderItems.length,
            itemBuilder: (context, index) {
              return sliderItems[index];
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(sliderItems.length, (index) {
            return Radio(
              fillColor: WidgetStateProperty.all(ColorsManager.yellow),
              value: index,
              groupValue: currentPageIndex,
              onChanged: (int? value) {
                setState(() {
                  currentPageIndex = value!;
                  pageController.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                });
              },
            );
          }),
        ),
      ],
    );
  }
}
