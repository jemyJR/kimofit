import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/top_bar.dart';
import 'package:kimofit/features/home/ui/widgets/contacts_widget.dart';
import 'package:kimofit/features/home/ui/widgets/home_shimmer/custom_home_container_shimmer.dart';
import 'package:kimofit/features/home/ui/widgets/home_shimmer/profile_and_indicator_shimmer.dart';
import 'package:kimofit/features/home/ui/widgets/home_shimmer/shimmer_with_text.dart';
import 'package:kimofit/generated/l10n.dart';

class BuildHomeLoading extends StatelessWidget {
  const BuildHomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: TopBar(
            welcomeText: Text(
              S.of(context).welcome,
              style: TextStyles.font22White,
            ),
            isTrainerNameLoading: true,
            homeWelcomeMessage: Text(
              S.of(context).homeWelcomeMessage,
              style: TextStyles.font18Gray,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ProfileAndIndicatorShimmer(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                  child: ShimmerWithText(
                    height: 150.h,
                    width: double.infinity,
                    text: S.of(context).Sponsor,
                    textStyle: TextStyles.font32BoldWhite,
                  ),
                ),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const CustomHomeContainerShimmer();
                  },
                ),
                const ContactsWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
