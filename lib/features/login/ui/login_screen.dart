import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/auth_message_and_navigate.dart';
import 'package:kimofit/core/widgets/container_with_top_border.dart';
import 'package:kimofit/core/widgets/top_bar.dart';
import 'package:kimofit/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:kimofit/features/login/ui/widgets/login_form.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:kimofit/core/widgets/background_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(imagePath: Assets.imagesBgAuth),
          const SafeArea(
            child: TopBar(),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ContainerWithTopBorder(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).welcome,
                      style: TextStyles.font32BoldWhite,
                    ),
                    Text(
                      S.of(context).loginMessage,
                      style: TextStyles.font18White,
                    ),
                    verticalSpace(15),
                    const LoginForm(),
                    verticalSpace(15),
                    const AuthMessageAndNavigate(
                      authMessageType: AuthMessageType.login,
                    ),
                    const LoginBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
