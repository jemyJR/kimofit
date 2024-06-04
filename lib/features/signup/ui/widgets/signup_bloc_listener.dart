import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/loading_widget.dart';
import 'package:kimofit/features/signup/logic/cubit/signup_cubit.dart';
import 'package:kimofit/generated/l10n.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingService = getIt<LoadingWidgetService>();
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          loadingService.showLoadingOverlay(context);
        }
        if (state is SignupSuccess) {
          loadingService.hideLoading();
          customSnackBar(context, S.of(context).signUpSuccessfully);
          context.pop();
        } else if (state is SignupFailure) {
          loadingService.hideLoading();
          customSnackBar(context, state.phone ?? state.deviceId ?? '');
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
