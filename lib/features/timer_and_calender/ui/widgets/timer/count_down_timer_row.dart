import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'count_down_timer.dart';

class CountDownTimerRow extends StatefulWidget {
  const CountDownTimerRow({
    super.key,
    required this.duration,
    required this.onComplete,
    required this.stop,
  });

  final int duration;
  final VoidCallback onComplete;
  final VoidCallback stop;

  @override
  State<CountDownTimerRow> createState() => _CountDownTimerRowState();
}

class _CountDownTimerRowState extends State<CountDownTimerRow> {
  final CountDownController controller = CountDownController();
  bool isPlaying = false;

  void handlePauseAndPlay() {
    // Get the current remaining time on the timer
    String? currentTime = controller.getTime();
    // Format the initial duration as "MM:SS"
    String initialDuration =
        "${widget.duration ~/ 60}:${(widget.duration % 60).toString().padLeft(2, '0')}";

    // If the timer is at "00:00", restart it with the initial duration
    if (currentTime == "00:00") {
      controller.restart(duration: widget.duration);
    } else if (isPlaying) {
      // If the timer is currently playing, pause it
      controller.pause();
    } else {
      // If the timer is not playing, check if it is at the initial duration
      if (currentTime == initialDuration) {
        // If at the initial duration, start the timer
        controller.start();
      } else {
        // Otherwise, resume the timer
        controller.resume();
      }
    }

    // Toggle the playing state
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: ColorsManager.yellow,
              size: 40.sp,
            ),
            onPressed: handlePauseAndPlay,
          ),
          CountDownTimer(
            duration: widget.duration,
            controller: controller,
            onComplete: () {
              setState(() {
                isPlaying = false;
              });
              widget.onComplete();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.stop,
              color: ColorsManager.yellow,
              size: 40.sp,
            ),
            onPressed: () {
              controller.reset();
              setState(() {
                isPlaying = false;
              });
              widget.stop();
            },
          ),
        ],
      ),
    );
  }
}
