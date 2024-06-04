import 'package:flutter/material.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';

enum AuthMessageType { login, signup }

class AuthMessageAndNavigate extends StatelessWidget {
  const AuthMessageAndNavigate({
    super.key,
    required this.authMessageType,
  });
  final AuthMessageType authMessageType;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: authMessageType == AuthMessageType.login
                ? S.of(context).newUser
                : S.of(context).currentUser,
            style: TextStyles.font18White,
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: InkWell(
              onTap: () => authMessageType == AuthMessageType.login
                  ? context.pushNamed(Routes.signUpScreen)
                  : context.pushNamed(Routes.loginScreen),
              child: Text(
                '  ${S.of(context).signup}',
                style: TextStyles.font18BlueBold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
