import 'package:flutter/material.dart';
import 'package:kimofit/features/timer_and_calendar/data/models/timer_option_model.dart';
import 'package:kimofit/generated/l10n.dart';

List<TimerOptionModel> buildTimerOptions(BuildContext context) {
  return [
    TimerOptionModel(
      label: '30 ${S.of(context).sec}',
      value: 30,
    ),
    TimerOptionModel(
      label: '1 ${S.of(context).min}',
      value: 60,
    ),
    TimerOptionModel(
      label: '1:30 ${S.of(context).min}',
      value: 90,
    ),
    TimerOptionModel(
      label: '2 ${S.of(context).min}',
      value: 120,
    ),
    TimerOptionModel(
      label: '2:30 ${S.of(context).min}',
      value: 150,
    ),
    TimerOptionModel(
      label: '3 ${S.of(context).min}',
      value: 180,
    ),
  ];
}
