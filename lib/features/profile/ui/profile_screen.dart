import 'package:flutter/material.dart';
import 'package:kimofit/core/theming/style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyles.font18BlueBold,
        ),
      ),
    );
  }
}
