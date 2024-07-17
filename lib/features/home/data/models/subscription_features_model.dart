import 'package:kimofit/core/helpers/localized_field.dart';

class SubscriptionFeaturesModel {
  final LocalizedField title;
  final List<String> features;
  SubscriptionFeaturesModel({
    required this.title,
    required this.features,
  });
}

//TODO: This is a dummy data, replace it with real data
List<SubscriptionFeaturesModel> subscriptionFeatures = [
  SubscriptionFeaturesModel(
    title: LocalizedField(
      en: "Warm up Exercises",
      ar: "تمارين الاحماء",
    ),
    features: [
      'Basic feature 1',
    ],
  ),
  SubscriptionFeaturesModel(
    title: LocalizedField(
      en: "Workout Exercises",
      ar: "نظام التمرين",
    ),
    features: [],
  ),
  SubscriptionFeaturesModel(
    title: LocalizedField(
      en: "Home Cardio Plan",
      ar: "كارديو البيت",
    ),
    features: [
      'Basic feature 1',
      'Basic feature 2',
      'Basic feature 3',
    ],
  ),
  SubscriptionFeaturesModel(
    title: LocalizedField(
      en: "Diet Plan",
      ar: "نظام التغذية",
    ),
    features: [
      'Basic feature 1',
      'Basic feature 2',
      'Basic feature 3',
      'Basic feature 4',
    ],
  ),
  SubscriptionFeaturesModel(
    title: LocalizedField(
      en: "Supplement",
      ar: "المكملات الغذائية",
    ),
    features: [
      'Basic feature 1',
      'Basic feature 2',
      'Basic feature 3',
      'Basic feature 4',
      'Basic feature 5',
    ],
  ),
  SubscriptionFeaturesModel(
    title: LocalizedField(
      en: "Food Recipe Book",
      ar: "كتاب الوصفات",
    ),
    features: [
      'Basic feature 1',
      'Basic feature 2',
      'Basic feature 3',
      'Basic feature 4',
      'Basic feature 5',
      'Basic feature 6',
    ],
  ),
];
