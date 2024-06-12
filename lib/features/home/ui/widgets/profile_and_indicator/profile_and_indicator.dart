import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/routing/animation_route/custom_animation_route.dart';
import 'package:kimofit/features/home/data/models/subscription_model.dart';
import 'package:kimofit/features/home/ui/widgets/profile_and_indicator/percent_indicator.dart';
import 'package:kimofit/features/home/ui/widgets/profile_and_indicator/profile_circle.dart';
import 'package:kimofit/features/home/ui/widgets/profile_and_indicator/subscription_date.dart';
import 'package:kimofit/core/routing/animation_route/custom_animation_wrapper.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_screen_builder.dart';

class ProfileAndIndicator extends StatelessWidget {
  const ProfileAndIndicator({super.key, required this.subscription});

  final SubscriptionModel subscription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 115.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsManager.dark,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        // CustomAnimatedRoute is a custom route to make a custom transition animation
                        // profile screen is the screen that will be navigated to
                        CustomAnimatedRoute(
                          screenWrapper: const CustomAnimatedWrapper(
                            screen: ProfileScreenBuilder(),
                          ),
                        ),
                      );
                    },
                    child: const ProfileCircle(
                      iconPath: Assets.animationProfile,
                      borderColor: ColorsManager.bgDark,
                    ),
                  ),
                ),
                verticalSpace(5),
                SubscriptionDate(
                  startDate: subscription.startDate.getMonthDay(),
                  endDate: subscription.endDate.getMonthDay(),
                ),
                verticalSpace(10),
                PercentIndicator(percent: subscription.percent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
