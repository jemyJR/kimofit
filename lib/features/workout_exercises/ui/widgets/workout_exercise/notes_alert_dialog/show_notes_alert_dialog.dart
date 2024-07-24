import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise/notes_alert_dialog/notes_alert_dialog.dart';

class ShownotesAlertDialog extends StatelessWidget {
  const ShownotesAlertDialog({
    super.key,
    required this.notes,
  });
  final List<String> notes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => notesAlertDialog(
        context,
        notes,
      ),
      child: Icon(
        Icons.info,
        size: 25.sp,
        color: ColorsManager.white,
      ),
    );
  }
}
