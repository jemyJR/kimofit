import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/not_found_widget.dart';
import 'package:kimofit/features/home/data/models/subscription_features_model.dart';
import 'package:kimofit/features/home/ui/widgets/home_shimmer/shimmer_normal.dart';
import 'package:kimofit/features/home/ui/widgets/home_category/rotated_corner_badge_decoration.dart';
import 'package:kimofit/generated/l10n.dart';

class CustomHomeContainer extends StatelessWidget {
  const CustomHomeContainer({
    super.key,
    required this.homeCategoryNav,
    required this.index,
    required this.text,
    required this.color,
    required this.imagePath,
    this.isPaid = false,
  });

  final String homeCategoryNav;
  final int index;
  final String text;
  final Color color;
  final String imagePath;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    final isFree = homeCategoryNav == Routes.workoutExercisesScreen;

    void handleTap(BuildContext context) {
      final routeName =
          isPaid || isFree ? homeCategoryNav : Routes.subscriptionScreen;
      final arguments = isPaid || isFree ? null : subscriptionFeatures[index];
      context.pushNamed(routeName, arguments: arguments);
    }

    return GestureDetector(
      onTap: () => handleTap(context),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        child: _buildContainer(context, isFree),
      ),
    );
  }

  Widget _buildContainer(BuildContext context, bool isFree) {
    return isPaid
        ? _buildHomeContainerStack()
        : Container(
            foregroundDecoration:
                isFree ? _buildRotatedCornerBadgeDecoration(context) : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: ColorFiltered(
                colorFilter: _buildColorFilter(isFree),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: CachedNetworkImage(
        height: 150.h,
        width: double.infinity,
        imageUrl: imagePath,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            ShimmerNormal(height: 150.h, width: double.infinity),
        errorWidget: (context, url, error) => const NotFoundWidget(),
        color: ColorsManager.black.withOpacity(0.2),
        colorBlendMode: BlendMode.darken,
      ),
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
              text,
              style: TextStyles.font18White,
            ),
          ),
        ),
      ),
    );
  }

  Decoration _buildRotatedCornerBadgeDecoration(BuildContext context) {
    return rotatedCornerBadgeDecoration(text: S.of(context).free);
  }

  ColorFilter _buildColorFilter(bool isFree) {
    return ColorFilter.mode(
      isFree ? Colors.transparent : ColorsManager.black.withOpacity(0.5),
      BlendMode.darken,
    );
  }
}
