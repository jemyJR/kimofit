import 'package:kimofit/core/helpers/localized_field.dart';

class CardioExerciseModel {
  final int id;
  final LocalizedField name;
  final String image;
  final int? reps;
  final int? sets;
  num? weight;
  final String? duration;
  List<String> notes;
  List<String> description;
  final int? groupId;

  CardioExerciseModel({
    required this.id,
    required this.name,
    required this.image,
    this.reps,
    this.sets,
    this.weight,
    this.duration,
    required this.notes,
    required this.description,
    this.groupId,
  });

  factory CardioExerciseModel.fromJson(Map<String, dynamic> json) {
    return CardioExerciseModel(
      id: json['id'],
      name: LocalizedField.fromJson(json['name']),
      image: json['image'],
      reps: json['reps'],
      sets: json['sets'],
      weight: json['weight'],
      duration: json['duration'],
      notes: List<String>.from(json['notes']),
      description: List<String>.from(json['description']),
      groupId: json['group-id'],
    );
  }
}
