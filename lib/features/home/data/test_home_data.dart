import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/home/data/models/category_model.dart';
import 'package:kimofit/features/home/data/models/sponser_model.dart';
import 'package:kimofit/features/home/data/models/subscription_model.dart';

final SubscriptionModel subscription = SubscriptionModel(
  startDate: '2024-06-11',
  endDate: '2024-06-19',
  status: true,
  percent: 26.666666666666668,
);
List<SponserModel> sponsors = [
  SponserModel(
    id: 1,
    name: 'مطعم الشيف',
    image:
        'https://kimofit-production.up.railway.app/media/sponsers/Sponser1.jpg',
    link: 'https://www.google.com',
  ),
  SponserModel(
    id: 2,
    name: 'مطعم الشيف',
    image:
        'https://kimofit-production.up.railway.app/media/sponsers/Sponser2.jpg',
    link: 'https://www.google.com',
  ),
  SponserModel(
    id: 3,
    name: 'Club 30',
    image:
        'https://kimofit-production.up.railway.app/media/sponsers/club30.jpg',
    link: 'https://www.facebook.com/Club30/',
  ),
];

List<HomeCategoryModel> categories = [
  HomeCategoryModel(
    id: 1,
    name: LocalizedField(
      en: "Warm up Exercises",
      ar: "تمارين الاحماء",
    ),
    image:
        "https://kimofit-production.up.railway.app/media/categories/WarmUpExercises.jpg",
  ),
  HomeCategoryModel(
    id: 2,
    name: LocalizedField(
      en: "Workout Exercises",
      ar: "نظام التمرين",
    ),
    image:
        "https://kimofit-production.up.railway.app/media/categories/WorkoutExercises.jpg",
  ),
  HomeCategoryModel(
    id: 3,
    name: LocalizedField(
      en: "Home Cardio Plan",
      ar: "كارديو البيت",
    ),
    image:
        "https://kimofit-production.up.railway.app/media/categories/HomeCardioPlan.jpg",
  ),
  HomeCategoryModel(
    id: 4,
    name: LocalizedField(
      en: "Diet Plan",
      ar: "نظام التغذية",
    ),
    image:
        "https://kimofit-production.up.railway.app/media/categories/DietPlan.jpg",
  ),
  HomeCategoryModel(
    id: 5,
    name: LocalizedField(
      en: "Supplement",
      ar: "المكملات الغذائية",
    ),
    image:
        "https://kimofit-production.up.railway.app/media/categories/Supplement.jpg",
  ),
];
