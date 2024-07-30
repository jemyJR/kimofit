import 'package:kimofit/core/helpers/localized_field.dart';

List<LocalizedField> days = [
  LocalizedField(en: 'one', ar: 'الاول'),
  LocalizedField(en: 'two', ar: 'الثاني'),
  LocalizedField(en: 'three', ar: 'الثالث'),
  LocalizedField(en: 'four', ar: 'الرابع'),
  LocalizedField(en: 'five', ar: 'الخامس'),
  LocalizedField(en: 'six', ar: 'السادس'),
  LocalizedField(en: 'seven', ar: 'السابع'),
];

List<LocalizedField> weeks = [
  LocalizedField(en: 'one', ar: 'الاول', id: '1'),
  LocalizedField(en: 'two', ar: 'الثاني', id: '2'),
  LocalizedField(en: 'three', ar: 'الثالث', id: '3'),
  LocalizedField(en: 'four', ar: 'الرابع', id: '4'),
];

LocalizedField notFoundDay = LocalizedField(en: 'not found', ar: 'غير موجود');

LocalizedField restDay = LocalizedField(en: 'off', ar: 'راحة');
