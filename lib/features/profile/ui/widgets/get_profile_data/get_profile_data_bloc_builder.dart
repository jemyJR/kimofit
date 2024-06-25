import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/features/profile/logic/profile_cubit.dart';
import 'package:kimofit/features/profile/ui/widgets/get_profile_data/get_profile_data_success.dart';
import 'package:kimofit/features/profile/ui/widgets/profile_data_column.dart';
import '../profile_list_view_with_title.dart';

class GetProfileDataBlocBuilder extends StatelessWidget {
  const GetProfileDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetProfleDataLoading) {
          return const ProfileDataColumn(
            stateType: ProfilestateType.loading,
          );
        }
        if (state is GetProfleDataSuccess) {
          return GetProfileDataSuccess(
            profileResponseModel: state.profileResponseModel,
          );
        }
        if (state is GetProfleDataFailure) {
          customSnackBar(context, state.errorMessage);
          return const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
