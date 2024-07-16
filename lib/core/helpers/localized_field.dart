import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class LocalizedField {
  final String en;
  final String ar;
  final String id; // Unique identifier

  LocalizedField({
    required this.en,
    required this.ar,
    String? id,
  }) : id = id ?? const Uuid().v4(); // Generate a unique id if none is provided

  LocalizedField copyWith({
    String? en,
    String? ar,
    String? id,
  }) {
    return LocalizedField(
      en: en ?? this.en,
      ar: ar ?? this.ar,
      id: id ?? this.id,
    );
  }

  factory LocalizedField.fromJson(Map<String, dynamic> json) {
    return LocalizedField(
      en: json['en'],
      ar: json['ar'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'en': en,
      'ar': ar,
      'id': id,
    };
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalizedField && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'LocalizedField{id: $id, en: $en, ar: $ar}';
  }
}
