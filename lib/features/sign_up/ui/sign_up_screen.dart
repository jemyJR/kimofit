import 'package:flutter/material.dart';
import 'package:kimofit/core/theming/style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyles.font18BlueBold,
        ),
      ),
      body: Center(
        child: Text(
          'Sign Up Screen',
          style: TextStyles.font18BlueBold,
        ),
      ),
    );
  }
}
