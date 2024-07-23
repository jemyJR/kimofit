import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_rounded_network_image.dart';
import 'package:kimofit/features/home/data/models/home_response_model/home_category_model.dart';
import 'package:kimofit/features/home/ui/widgets/home_category/home_cadegory_arguments_model.dart';
import 'package:kimofit/features/home/ui/widgets/home_category/rotated_corner_badge_decoration.dart';

class CustomHomeContainer extends StatelessWidget {
  const CustomHomeContainer({
    super.key,
    required this.homeCardCategoryArguments,
    required this.category,
    this.color = ColorsManager.blue,
  });

  final HomeCardCategoryArguments homeCardCategoryArguments;
  final HomeCategoryModel category;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        homeCardCategoryArguments.routeName,
        arguments: homeCardCategoryArguments.arguments,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        child: _buildContainer(),
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      foregroundDecoration: _buildRotatedCornerBadgeDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: ColorFiltered(
          colorFilter: _buildColorFilter(),
          child: _buildHomeContainerStack(),
        ),
      ),
    );
  }

  Widget _buildHomeContainerStack() {
    return Stack(
      children: [
        _buildHomeCategoryImage(),
        _buildBorderContainerWithText(),
      ],
    );
  }

  Widget _buildHomeCategoryImage() {
    return CustomRoundedNetworkImage(
      imageUrl: category.image,
      height: 150.h,
      width: double.infinity,
      withColorOverlay: true,
      opacity: 0.2,
    );
  }

  Widget _buildBorderContainerWithText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: color, width: 3),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: _buildContainerWithText(),
      ),
    );
  }

  Widget _buildContainerWithText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 50.w),
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              category.name.getLocalizedText(),
              style: TextStyles.font18White,
            ),
          ),
        ),
      ),
    );
  }

  Decoration? _buildRotatedCornerBadgeDecoration() {
    return homeCardCategoryArguments.badged
        ? rotatedCornerBadgeDecoration(
            text: homeCardCategoryArguments.badgedText,
            color: homeCardCategoryArguments.badgeColor,
          )
        : null;
  }

  ColorFilter _buildColorFilter() {
    return ColorFilter.mode(
      !homeCardCategoryArguments.colorFiltered
          ? Colors.transparent
          : ColorsManager.black.withOpacity(0.5),
      BlendMode.darken,
    );
  }
}
