class Routes {
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String loginScreen = '/loginScreen';

  static final Map<String, String> _routes = {
    'onBoardingScreen': onBoardingScreen,
    'loginScreen': loginScreen,
  };

  static String getRoutePath(String routeName) {
    return _routes[routeName] ?? '/';
  }
}
