import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/not_found_widget.dart';
import 'package:kimofit/features/home/ui/widgets/home_shimmer/shimmer_normal.dart';

class CustomRoundedNetworkImage extends StatelessWidget {
  const CustomRoundedNetworkImage({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
    this.placeholder,
    this.errorWidget,
    this.withColorOverlay = false,
    this.opacity = 0.5,
  });
  final double height;
  final double width;
  final String imageUrl;
  final Widget? placeholder;
  final Widget? errorWidget;
  final bool? withColorOverlay;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            placeholder ?? ShimmerNormal(height: height, width: width),
        errorWidget: (context, url, error) =>
            errorWidget ?? const NotFoundWidget(),
        color:
            withColorOverlay! ? ColorsManager.black.withOpacity(opacity) : null,
        colorBlendMode: withColorOverlay! ? BlendMode.darken : null,
      ),
    );
  }
}
