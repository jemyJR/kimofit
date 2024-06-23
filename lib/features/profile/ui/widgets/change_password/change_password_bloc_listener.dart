import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/loading_widget.dart';
import 'package:kimofit/features/profile/logic/profile_cubit.dart';

class ChangePasswordBlocListener extends StatelessWidget {
  const ChangePasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingService = getIt<LoadingWidgetService>();
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ChangePasswordLoading) {
          loadingService.showLoadingOverlay(context);
        }
        if (state is ChangePasswordSuccess) {
          loadingService.hideLoading();
          customSnackBar(context, state.success);
          context.pop();
        } else if (state is ChangePasswordFailure) {
          loadingService.hideLoading();
          customSnackBar(context, state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
