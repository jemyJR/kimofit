import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/features/home/ui/widgets/profile_and_indicator/profile_circle.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Stack(
        children: [
          Container(
            height: 110.h,
            decoration: BoxDecoration(
              color: ColorsManager.dark,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.r),
                bottomRight: Radius.circular(40.r),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: ProfileCircle(
              iconPath: Assets.animationProfile,
              borderColor: ColorsManager.dark,
            ),
          ),
        ],
      ),
    );
  }
}
