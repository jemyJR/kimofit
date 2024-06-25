import 'package:flutter/material.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/profile/data/models/profile_list_title_model.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_list_title.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_list_title_shimmer.dart';

enum ProfilestateType { sucess, loading }

class ProfileListViewWithTitle extends StatelessWidget {
  const ProfileListViewWithTitle({
    super.key,
    required this.title,
    required this.listLength,
    required this.proflileDataList,
    required this.stateType,
  });
  final String title;
  final int listLength;
  final List<ProfileListTitleModel> proflileDataList;
  final ProfilestateType stateType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font18White,
        ),
        ListView.builder(
          itemCount: listLength,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return stateType == ProfilestateType.sucess
                ? ProfileListTitle(
                    profileListTitleModel: proflileDataList[index],
                  )
                : ProfileListTitleShimmer(
                    profileListTitleModel: proflileDataList[index],
                  );
          },
        ),
      ],
    );
  }
}
