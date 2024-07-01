import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/generated/l10n.dart';

class DietPlanNotesScreen extends StatelessWidget {
  const DietPlanNotesScreen({super.key, required this.notes});
  final List<String> notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: S.current.notes,
      ),
    );
  }
}
