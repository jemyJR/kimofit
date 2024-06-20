import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/app_buttons.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/home/data/models/subscription_features_model.dart';
import 'package:kimofit/core/widgets/show_title_with_list.dart';
import 'package:kimofit/generated/l10n.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key, required this.subscriptionFeatures});
  final SubscriptionFeaturesModel subscriptionFeatures;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.bgDark,
        appBar: CustomAppBar(
          title: S.of(context).subscription,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: ColorsManager.yellow,
                radius: 40.r,
                child: Icon(
                  Icons.attach_money,
                  color: ColorsManager.bgDark,
                  size: 50.sp,
                ),
              ),
              verticalSpace(20),
              Text(
                S.of(context).SubscriptionMessage,
                style: TextStyles.font15White.copyWith(height: 1.5.sp),
              ),
              verticalSpace(20),
              ShowTitleWithList(
                title:
                    '${subscriptionFeatures.title.getLocalizedText()} ${S.of(context).SubscriptionFeatures}',
                list: subscriptionFeatures.features,
              ),
              const Spacer(),
              getButtonType(context, ButtonType.contactme),
            ],
          ),
        ));
  }
}
