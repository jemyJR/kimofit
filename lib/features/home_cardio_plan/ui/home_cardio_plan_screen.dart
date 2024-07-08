import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/timer_and_calender/ui/timer_and_calender.dart';

class HomeCardioPlanScreen extends StatelessWidget {
  const HomeCardioPlanScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: title,
      ),
      body: TimerAndCalender(
        days: days,
        weeks: weeks,
      ),
    );
  }
}

//TODO: Remove this dummy data and replace it with real data
List<LocalizedField> days = [
  LocalizedField(en: 'one', ar: 'الاول', id: '1'),
  LocalizedField(en: 'two', ar: 'الثاني', id: '2'),
  LocalizedField(en: 'OFF', ar: 'الراحه', id: '3'),
  LocalizedField(en: 'four', ar: 'الرابع', id: '4'),
  LocalizedField(en: 'five', ar: 'الخامس', id: '5'),
  LocalizedField(en: 'six', ar: 'السادس', id: '6'),
  LocalizedField(en: 'OFF', ar: 'الراحه', id: '7'),
];

List<LocalizedField> weeks = [
  LocalizedField(en: 'one', ar: 'الاول', id: '1'),
  LocalizedField(en: 'two', ar: 'الثاني', id: '2'),
  LocalizedField(en: 'three', ar: 'الثالث', id: '3'),
  LocalizedField(en: 'four', ar: 'الرابع', id: '4'),
];
