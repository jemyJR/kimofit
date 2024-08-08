import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/features/workout_exercises/data/models/exercise_logs_model.dart';

class GeneralExerciseModel {
  final int id;
  final LocalizedField name;
  final String image;
  final String video;
  final int? sets;
  final List<ExerciseLogsModel>? logs;
  final String? weightType;
  List<String> notes;
  List<String> description;
  final int? groupId;

  GeneralExerciseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.video,
    this.sets,
    this.logs,
    this.weightType,
    required this.notes,
    required this.description,
    this.groupId,
  });

  factory GeneralExerciseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> logs = json[ApiKey.workoutExerciseLogs] ?? [];

    return GeneralExerciseModel(
      id: json[ApiKey.workoutExerciseID],
      name: LocalizedField.fromJson(json[ApiKey.workoutExerciseName]),
      image: json[ApiKey.workoutExerciseImage],
      video: json[ApiKey.workoutExerciseVideo],
      sets: json[ApiKey.workoutExerciseSets],
      logs: logs.map((e) => ExerciseLogsModel.fromJson(e)).toList(),
      weightType: json[ApiKey.workoutExerciseWeightType],
      notes: List<String>.from(json[ApiKey.workoutExerciseNotes]),
      description: List<String>.from(json[ApiKey.workoutExerciseDescription]),
      groupId: json[ApiKey.workoutExerciseGroupID],
    );
  }
}
