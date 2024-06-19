import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';

class SubscriptionDate extends StatelessWidget {
  const SubscriptionDate(
      {super.key, required this.startDate, required this.endDate});
  final String startDate;
  final String endDate;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildDateText(context, S.of(context).start, startDate),
          const VerticalDivider(
            color: ColorsManager.blue,
            thickness: 2,
          ),
          buildDateText(context, S.of(context).end, endDate),
        ],
      ),
    );
  }
}

Widget buildDateText(BuildContext context, String label, String date) {
  return Flexible(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          label,
          style: TextStyles.font18White,
        ),
        Text(
          date,
          style: TextStyles.font18White,
        ),
      ],
    ),
  );
}
