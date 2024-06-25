import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/launch_url.dart';
import 'package:kimofit/core/networking/user_credentials/user_credentials.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/core/widgets/custom_button.dart';
import 'package:kimofit/core/widgets/loading_widget.dart';
import 'package:kimofit/features/profile/ui/widgets/change_password/change_password_form.dart';
import 'package:kimofit/generated/l10n.dart';

enum ButtonType {
  changeLanguage,
  contactme,
  changePasswordScreen,
  changePasswordLogic,
  logOut,
}

Widget getButtonType(BuildContext context, ButtonType type, {Color? btnColor}) {
  switch (type) {
    case ButtonType.changeLanguage:
      return CustomButton(
        text: S.of(context).language,
        textStyle: TextStyles.font15White,
        backgroundColor: btnColor ?? ColorsManager.blue,
        onPressed: () =>
            LoadingWidgetService().changeLanguageWithDelay(context),
      );

    case ButtonType.contactme:
      return CustomButton(
        text: S.of(context).contactme,
        textStyle: TextStyles.font18White,
        backgroundColor: btnColor ?? ColorsManager.green,
        onPressed: () => launchURL(SocialMediaLinks.whatsapp),
        icon: const FaIcon(
          FontAwesomeIcons.whatsapp,
          color: ColorsManager.white,
        ),
      );
    case ButtonType.changePasswordScreen:
      return CustomButton(
        text: S.of(context).changePassword,
        textStyle: TextStyles.font18White,
        backgroundColor: btnColor ?? ColorsManager.yellow,
        onPressed: () => context.pushNamed(Routes.changePasswordScreen),
        icon: const Icon(
          FontAwesomeIcons.key,
          color: ColorsManager.white,
        ),
      );
    case ButtonType.changePasswordLogic:
      return CustomButton(
        text: S.of(context).changePassword,
        textStyle: TextStyles.font18White,
        backgroundColor: btnColor ?? ColorsManager.yellow,
        onPressed: () => validateThenDoChangePassword(context),
        icon: const Icon(
          FontAwesomeIcons.key,
          color: ColorsManager.white,
        ),
      );
    case ButtonType.logOut:
      return CustomButton(
        text: S.of(context).logOut,
        textStyle: TextStyles.font18White,
        backgroundColor: btnColor ?? ColorsManager.bgDark,
        onPressed: () => UserCredentials.deleteAll(
          S.of(context).loggedOutSuccessfully,
        ),
        icon: const Icon(
          FontAwesomeIcons.arrowRightFromBracket,
          color: ColorsManager.white,
        ),
      );
  }
}
