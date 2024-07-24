class WorkoutExerciseLogModel {
  final int sets;
  final int reps;
  final num weight;

  WorkoutExerciseLogModel({
    required this.sets,
    required this.reps,
    required this.weight,
  });

  factory WorkoutExerciseLogModel.fromJson(Map<String, dynamic> json) {
    return WorkoutExerciseLogModel(
      sets: json['sets'],
      reps: json['reps'],
      weight: json['weight'],
    );
  }
}
