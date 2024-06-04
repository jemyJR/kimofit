class Routes {
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String homeScreen = '/homeScreen';

  static final Map<String, String> _routes = {
    'onBoardingScreen': onBoardingScreen,
    'loginScreen': loginScreen,
    'signUpScreen': signUpScreen,
    'homeScreen': homeScreen,
  };

  static String getRoutePath(String routeName) {
    return _routes[routeName] ?? '/';
  }
}
