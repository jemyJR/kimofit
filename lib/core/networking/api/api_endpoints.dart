import 'package:kimofit/core/networking/user_credentials/user_credentials.dart';

class ApiEndPoints {
  static const String apiBaseUrl = 'https://kimofit-production.up.railway.app/';

  static const String login = 'trainees/login/';
  static const String signup = 'trainees/signup/';
  static const String home = 'home/';
  static const String changePassword = 'trainees/password-update/';
  static const String refreshToken = 'trainees/token/refresh/';
  static Future<String> profile() async {
    String? traineeId = await UserCredentials.getId();
    if (traineeId != null) {
      return '/trainees/profiles/$traineeId/';
    } else {
      throw Exception("Trainee ID not found");
    }
  }

  static const String supplement = 'supplements/all/';
  static const String diet = '/diets/all/';
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
  static const String id = 'traineeID';

  //! Token keys
  static const String token = 'access';
  static const String refreshToken = 'refresh';
  static const String tokenNotValid = 'token_not_valid';
  static const String tokenExpiredMessage = 'Token is invalid or expired';

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
  static const String subscriptionPercent = 'percentage';
  static const String subscriptionIsPaid = 'monthly';
  static const String homeErrorMessage = 'message';

  //! LocalizedField keys
  static const String en = 'en';
  static const String ar = 'ar';

  //! Change Password
  static const String oldPassword = 'old_password';
  static const String newPassword = 'new_password';
  static const String success = 'success';

  //! profile keys
  static const String age = 'age';
  static const String height = 'height';
  static const String weight = 'weight';
  static const String subscriptionMonths = 'subscription_months';

  //! Supplement keys
  static const String supplementName = 'name';
  static const String supplementImage = 'image';
  static const String supplementDose = 'dose';
  static const String supplementTimes = 'time_description';
  static const String results = 'results';
  static const String count = 'count';

  //! Diet keys
  static const String dietImage = 'image';
  static const String dietNotes = 'notes';
  static const String diets = 'diets';
  static const String dietTitle = 'title';
  static const String dietMeals = 'meals';
  static const String dietMealName = 'name';
  static const String dietOptions = 'options';
  static const String dietIngredients = 'ingredients';
}
