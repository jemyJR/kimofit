import 'package:flutter/material.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/profile/data/models/profile_list_title_model.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_list_title.dart';

class ProfileListViewWithTitle extends StatelessWidget {
  const ProfileListViewWithTitle({
    super.key,
    required this.title,
    required this.proflileDataList,
  });
  final String title;
  final List<ProfileListTitleModel> proflileDataList;

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
          itemCount: proflileDataList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ProfileListTitle(
              profileListTitleModel: proflileDataList[index],
            );
          },
        ),
      ],
    );
  }
}
