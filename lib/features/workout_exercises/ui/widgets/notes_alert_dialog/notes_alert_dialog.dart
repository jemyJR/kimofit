import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';

void notesAlertDialog(context, List<String> exersicesNotes) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorsManager.dark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        title: Text(
          S.of(context).notes,
          textAlign: TextAlign.center,
          style: TextStyles.font22Blue,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: exersicesNotes
                .map(
                  (note) => Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info,
                          size: 25.sp,
                          color: ColorsManager.blue,
                        ),
                        horizontalSpace(10),
                        Expanded(
                          child: Text(
                            note,
                            style: TextStyles.font15White,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              S.of(context).close,
              style: TextStyles.font15Blue,
            ),
            onPressed: () => context.pop(),
          ),
        ],
      );
    },
  );
}
