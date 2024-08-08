import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/helpers/launch_url.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_network_image.dart';
import 'package:kimofit/features/home/data/models/home_response_model/sponser_model.dart';
import 'package:kimofit/features/home/ui/widgets/home_shimmer/shimmer_with_text.dart';
import 'package:kimofit/generated/l10n.dart';

class SponsorCard extends StatelessWidget {
  const SponsorCard({super.key, required this.sponsor});
  final SponserModel sponsor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchURL(sponsor.link),
      child: CustomNetworkImage(
        height: 150.h,
        width: double.infinity,
        imageUrl: sponsor.image,
        placeholder: ShimmerWithText(
          height: 150.h,
          width: double.infinity,
          text: S.of(context).Sponsor,
          textStyle: TextStyles.font32BoldWhite,
        ),
      ),
    );
  }
}
