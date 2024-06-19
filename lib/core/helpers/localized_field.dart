import 'package:intl/intl.dart';

class LocalizedField {
  final String en;
  final String ar;

  LocalizedField({
    required this.en,
    required this.ar,
  });

  factory LocalizedField.fromJson(Map<String, dynamic> json) {
    return LocalizedField(
      en: json['en'],
      ar: json['ar'],
    );
  }

  String getLocalizedText() {
    switch (Intl.getCurrentLocale()) {
      case 'ar':
        return ar;
      case 'en':
      default:
        return en;
    }
  }
}
