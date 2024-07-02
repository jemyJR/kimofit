import 'package:no_screenshot/no_screenshot.dart';

class ScreenshotService {
  final NoScreenshot _noScreenshot = NoScreenshot.instance;

  void initialize() {
    _checkAndPreventScreenshots(); // Check and prevent screenshots
  }

  Future<void> _checkAndPreventScreenshots() async {
    // Disable both screenshot and screen recording capabilities
    bool isScreenshotEnabled = await _noScreenshot.screenshotOn();
    if (isScreenshotEnabled) {
      await _noScreenshot.screenshotOff();
    }
  }
}
