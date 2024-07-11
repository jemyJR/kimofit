import 'package:flutter/material.dart';
import 'package:kimofit/features/timer_and_calender/data/models/timer_option_model.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/timer/timer_option_container.dart';
import 'package:kimofit/features/timer_and_calender/data/build_timer_options_list.dart';

class TimerOption extends StatelessWidget {
  const TimerOption({
    super.key,
    required this.onSelectDuration,
  });
  final Function(int) onSelectDuration;

  @override
  Widget build(BuildContext context) {
    final timerOptions = buildTimerOptions(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTimerOptionRow(timerOptions.sublist(0, 3)),
          _buildTimerOptionRow(timerOptions.sublist(3, 6)),
        ],
      ),
    );
  }

  Widget _buildTimerOptionRow(List<TimerOptionModel> options) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: options
          .map((option) => TimerOptionContainer(
                duration: option.label,
                onTap: () => onSelectDuration(option.value),
              ))
          .toList(),
    );
  }
}
