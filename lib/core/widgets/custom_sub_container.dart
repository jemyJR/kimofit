import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_rounded_network_image.dart';

class CustomSubContainer extends StatelessWidget {
  const CustomSubContainer({
    super.key,
    required this.height,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  final double height;
  final String title;
  final String imagePath;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        child: SizedBox(
          width: double.infinity,
          height: height,
          child: Stack(
            children: [
              CustomRoundedNetworkImage(
                height: height,
                width: double.infinity,
                imageUrl: imagePath,
                withColorOverlay: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: ColorsManager.yellow,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyles.font18White,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
