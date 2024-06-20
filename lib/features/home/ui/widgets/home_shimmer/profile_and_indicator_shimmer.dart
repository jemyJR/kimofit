import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/features/home/ui/widgets/profile_and_indicator/percent_indicator.dart';
import 'package:kimofit/features/home/ui/widgets/profile_and_indicator/profile_circle.dart';
import 'package:kimofit/features/home/ui/widgets/profile_and_indicator/subscription_date.dart';
import 'package:shimmer/shimmer.dart';

class ProfileAndIndicatorShimmer extends StatelessWidget {
  const ProfileAndIndicatorShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.dark,
      highlightColor: ColorsManager.gray,
      child: Padding(
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
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 85.h,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 5.w,
                        ),
                        child: const ProfileCircle(
                          iconPath: Assets.animationProfile,
                          borderColor: ColorsManager.bgDark,
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(5),
                  const SubscriptionDate(
                    startDate: '00/00',
                    endDate: '00/00',
                  ),
                  verticalSpace(10),
                  const PercentIndicator(percent: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
