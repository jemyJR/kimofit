import 'package:flutter/material.dart';

class CustomAnimatedWrapper extends StatefulWidget {
  const CustomAnimatedWrapper({super.key, required this.screen});
  final Widget screen;

  @override
  CustomAnimatedWrapperState createState() => CustomAnimatedWrapperState();
}

class CustomAnimatedWrapperState extends State<CustomAnimatedWrapper>
    with TickerProviderStateMixin {
  bool backPressed = false;

  late AnimationController _increasingCurveController;
  late AnimationController _decreasingCurveController;

  late Animation<double> _increasingCurveAnimation;
  late Animation<double> _decreasingCurveAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _increasingCurveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _decreasingCurveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _increasingCurveAnimation = _createAnimation(
      controller: _increasingCurveController,
      begin: 500.0,
      end: 0.0,
    );

    _decreasingCurveAnimation = _createAnimation(
      controller: _decreasingCurveController,
      begin: 0.0,
      end: 200.0,
    );

    _increasingCurveController.forward();
  }

  Animation<double> _createAnimation({
    required AnimationController controller,
    required double begin,
    required double end,
  }) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _increasingCurveController.dispose();
    _decreasingCurveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool isBackButton) {
        setState(() {
          backPressed = true;
        });
        _decreasingCurveController.forward();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          backPressed
              ? _decreasingCurveAnimation.value
              : _increasingCurveAnimation.value,
        ),
        child: widget.screen,
      ),
    );
  }
}
