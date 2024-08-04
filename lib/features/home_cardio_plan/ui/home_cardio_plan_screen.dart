import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/home_cardio_plan/logic/widgets/home_cardio_consumer.dart';

class HomeCardioPlanScreen extends StatelessWidget {
  final String title;

  const HomeCardioPlanScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: title,
      ),
      body: const HomeCardioBlocConsumer(),
    );
  }
}
