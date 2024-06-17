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
