import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/not_found_widget.dart';
import 'package:kimofit/features/home/ui/widgets/home_shimmer/shimmer_normal.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';

class CustomSubContainer extends StatelessWidget {
  const CustomSubContainer({
    super.key,
    required this.height,
    required this.warmUpCategoryModel,
    required this.onTap,
  });

  final double height;
  final WarmUpCategoryModel warmUpCategoryModel;
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  height: height,
                  width: double.infinity,
                  imageUrl: warmUpCategoryModel.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      ShimmerNormal(height: height, width: double.infinity),
                  errorWidget: (context, url, error) => const NotFoundWidget(),
                  color: ColorsManager.black.withOpacity(0.5),
                  colorBlendMode: BlendMode.darken,
                ),
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
                      warmUpCategoryModel.name.getLocalizedText(),
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
