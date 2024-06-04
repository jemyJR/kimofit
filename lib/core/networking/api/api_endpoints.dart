class ApiEndPoints {
  static const String apiBaseUrl = 'https://kimofit-production.up.railway.app/';

  static const String login = 'trainees/login/';
  static const String signup = 'trainees/signup/';
}

class ApiKey {
  //! Errors keys
  static const String errorMessage = 'error';
  static const String errorCode = 'code';

  //! Headers keys
  static const String acceptLanguage = 'Accept-Language';

  //! Login keys
  static const String phone = 'phone_number';
  static const String password = 'password';
  static const String deviceId = 'registered_device_id';

  //! Token keys
  static const String token = 'access';
  static const String refreshToken = 'refresh';

  //! signup keys
  static const String name = 'full_name';
}
