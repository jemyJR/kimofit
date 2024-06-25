import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kimofit/features/profile/data/models/profile_list_title_model.dart';
import 'package:kimofit/features/profile/data/models/profile_response_model.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_data_column.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_list_title.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_list_view_with_title.dart';
import 'package:kimofit/generated/l10n.dart';

class GetProfileDataSuccess extends StatelessWidget {
  const GetProfileDataSuccess({super.key, required this.profileResponseModel});
  final ProfileResponseModel profileResponseModel;

  @override
  Widget build(BuildContext context) {
    final trainee = profileResponseModel.trainee;
    final subscription = profileResponseModel.subscription;
    final bool isPaid = subscription.isPaid;

    final personalList = [
      ProfileListTitleModel(
        title: S.of(context).name,
        data: trainee.name.getLocalizedText(),
        leadingIcon: FontAwesomeIcons.user,
      ),
      ProfileListTitleModel(
        title: S.of(context).number,
        data: trainee.phone.startsWith('+20')
            ? trainee.phone.substring(2)
            : trainee.phone,
        leadingIcon: FontAwesomeIcons.phone,
      ),
      if (trainee.age != null)
        ProfileListTitleModel(
          title: S.of(context).age,
          data: trainee.age.toString(),
          leadingIcon: FontAwesomeIcons.calendar,
        ),
      if (trainee.height != null)
        ProfileListTitleModel(
          title: S.of(context).length,
          data: trainee.height.toString(),
          leadingIcon: FontAwesomeIcons.ruler,
          trailingText: TraillingTextEnum.cm,
        ),
      if (trainee.weight != null)
        ProfileListTitleModel(
          title: S.of(context).weight,
          data: trainee.weight.toString(),
          leadingIcon: FontAwesomeIcons.weightScale,
          trailingText: TraillingTextEnum.kg,
        )
    ];

    final subscriptionList = [
      ProfileListTitleModel(
        title: S.of(context).startDate,
        data: subscription.startDate,
        leadingIcon: FontAwesomeIcons.hourglassStart,
      ),
      ProfileListTitleModel(
        title: S.of(context).endDate,
        data: subscription.endDate,
        leadingIcon: FontAwesomeIcons.hourglassEnd,
      ),
      ProfileListTitleModel(
        title: S.of(context).duration,
        data: isPaid ? subscription.subscriptionMonths.toString() : '8',
        leadingIcon: FontAwesomeIcons.clock,
        trailingText: isPaid ? TraillingTextEnum.month : TraillingTextEnum.days,
      ),
    ];

    return ProfileDataColumn(
      personalInformationListLength: isPaid ? personalList.length : 2,
      stateType: ProfilestateType.sucess,
      personalList: personalList,
      subscriptionList: subscriptionList,
    );
  }
}
