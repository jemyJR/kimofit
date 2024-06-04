import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/loading_widget.dart';
import 'package:kimofit/features/login/logic/cubit/login_cubit.dart';
import 'package:kimofit/generated/l10n.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingService = getIt<LoadingWidgetService>();
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          loadingService.showLoadingOverlay(context);
        }
        if (state is LoginSuccess) {
          loadingService.hideLoading();
          customSnackBar(context, S.of(context).loggedInSuccessfully);
          context.pushNamed(Routes.homeScreen);
        } else if (state is LoginFailure) {
          loadingService.hideLoading();
          customSnackBar(context, state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
