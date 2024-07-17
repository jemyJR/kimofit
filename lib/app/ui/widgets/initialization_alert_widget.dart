import 'package:flutter/material.dart';
import 'package:kimofit/core/helpers/device_id_service.dart';

class InitializationAlertWidget extends StatefulWidget {
  final Widget child;

  const InitializationAlertWidget({super.key, required this.child});

  @override
  State<InitializationAlertWidget> createState() =>
      _InitializationAlertWidgetState();
}

class _InitializationAlertWidgetState extends State<InitializationAlertWidget> {
  @override
  void initState() {
    super.initState();
    // Ensure the important notice is shown only once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      DeviceIdService.showImportantNotice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
