import 'package:intl/intl.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';

class LocalizedField {
  final String en;
  final String ar;

  LocalizedField({
    required this.en,
    required this.ar,
  });

  factory LocalizedField.fromJson(Map<String, dynamic> json) {
    return LocalizedField(
      en: json[ApiKey.en],
      ar: json[ApiKey.ar],
    );
  }

  String getLocalizedText() {
    switch (Intl.getCurrentLocale()) {
      case ApiKey.ar:
        return ar;
      case ApiKey.en:
      default:
        return en;
    }
  }
}
