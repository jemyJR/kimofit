import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final String imagePath;
  const BackgroundWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
