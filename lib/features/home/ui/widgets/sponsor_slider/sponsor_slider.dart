import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/features/home/data/models/sponser_model.dart';
import 'package:kimofit/features/home/ui/widgets/sponsor_card.dart';

class SponsorSlider extends StatelessWidget {
  const SponsorSlider({super.key, required this.sponsors});
  final List<SponserModel> sponsors;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        final sponsor = sponsors[itemIndex];
        return SponsorCard(sponsor: sponsor);
        // return const SponsorCardShimmer();
      },
      options: CarouselOptions(
        height: 150.h,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
    );
  }
}
