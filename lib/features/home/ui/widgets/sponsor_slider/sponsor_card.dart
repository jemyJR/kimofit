import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/helpers/launch_url.dart';
import 'package:kimofit/features/home/data/models/sponser_model.dart';

class SponsorCard extends StatelessWidget {
  const SponsorCard({super.key, required this.sponsor});
  final SponserModel sponsor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchURL(sponsor.link),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.network(
          height: 150.h,
          width: double.infinity,
          sponsor.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
