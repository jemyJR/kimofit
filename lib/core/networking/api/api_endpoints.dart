class ApiEndPoints {
  static const String apiBaseUrl = 'https://kimofit-production.up.railway.app/';

  static const String login = 'trainees/login/';
  static const String signup = 'trainees/signup/';
  static const String home = 'home/';
}

class ApiKey {
  //! Errors keys
  static const String errorMessage = 'error';
  static const String errorCode = 'code';

  //! Headers keys
  static const String acceptLanguage = 'Accept-Language';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer ';

  //! Login keys
  static const String phone = 'phone_number';
  static const String password = 'password';
  static const String deviceId = 'registered_device_id';

  //! Token keys
  static const String token = 'access';
  static const String refreshToken = 'refresh';

  //! signup keys
  static const String name = 'full_name';

  //! Home keys
  static const String sponsers = 'sponsers';
  static const String sponserId = 'id';
  static const String sponserName = 'name';
  static const String sponserImage = 'image';
  static const String sponserLink = 'link';
  static const String categories = 'categories';
  static const String categoryId = 'id';
  static const String categoryName = 'name';
  static const String categoryImage = 'image';
  static const String trainee = 'trainee';
  static const String trainerName = 'name';
  static const String subscription = 'subscription';
  static const String subscriptionStartDate = 'starts';
  static const String subscriptionEndDate = 'ends';
  static const String subscriptionStatus = 'status';
  static const String subscriptionPercent = 'subscription_percentage';
  static const String subscriptionIsPaid = 'monthly';
  static const String homeErrorMessage = 'message';

  //! LocalizedField keys
  static const String en = 'en';
  static const String ar = 'ar';
}
