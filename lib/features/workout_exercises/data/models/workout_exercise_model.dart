import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/workout_exercises/data/models/workout_exercise_log_model.dart';

class WorkoutExerciseModel {
  final LocalizedField name;
  final String image;
  final String video;
  final List<WorkoutExerciseLogModel> logs;
  List<String> notes;
  List<String> description;
  final int? groupId;

  WorkoutExerciseModel({
    required this.name,
    required this.image,
    required this.video,
    required this.logs,
    required this.notes,
    required this.description,
    this.groupId,
  });

  factory WorkoutExerciseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> logs = json['logs'];
    return WorkoutExerciseModel(
      name: LocalizedField.fromJson(json['name']),
      image: json['image'],
      video: json['video'],
      logs: logs.map((e) => WorkoutExerciseLogModel.fromJson(e)).toList(),
      notes: List<String>.from(json['notes']),
      description: List<String>.from(json['description']),
      groupId: json['group-id'],
    );
  }
}
