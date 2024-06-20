import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/helpers/launch_url.dart';

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconButton(
              icon: FontAwesomeIcons.facebook,
              link: SocialMediaLinks.facebookAccount,
            ),
            _buildDivider(),
            _buildIconButton(
              icon: FontAwesomeIcons.facebook,
              link: SocialMediaLinks.facebookPage,
            ),
            _buildDivider(),
            _buildIconButton(
              icon: FontAwesomeIcons.instagram,
              link: SocialMediaLinks.instagramAccount,
            ),
            _buildDivider(),
            _buildIconButton(
              icon: FontAwesomeIcons.whatsapp,
              link: SocialMediaLinks.whatsapp,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildIconButton({
  required IconData icon,
  required String link,
}) {
  return IconButton(
    icon: FaIcon(
      icon,
      color: ColorsManager.blue,
    ),
    onPressed: () => launchURL(link),
  );
}

Widget _buildDivider() {
  return const VerticalDivider(
    color: ColorsManager.blue,
    thickness: 2,
  );
}
