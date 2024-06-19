import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';

class ShowTitleWithList extends StatelessWidget {
  const ShowTitleWithList({super.key, required this.title, required this.list});
  final List<String> list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.font22Blue,
        ),
        verticalSpace(10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_box,
                    color: ColorsManager.green,
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: Text(
                      list[index],
                      style: TextStyles.font15White,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
