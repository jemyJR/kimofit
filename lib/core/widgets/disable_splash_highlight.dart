import 'package:flutter/material.dart';

class DisableSplashHighlight extends StatelessWidget {
  const DisableSplashHighlight({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: child,
    );
  }
}
