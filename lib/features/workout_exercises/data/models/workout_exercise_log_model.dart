class WorkoutExerciseLogModel {
  final int sets;
  final int reps;
  final num weight;

  WorkoutExerciseLogModel({
    required this.sets,
    required this.reps,
    required this.weight,
  });

  WorkoutExerciseLogModel copyWith({
    int? sets,
    int? reps,
    num? weight,
  }) {
    return WorkoutExerciseLogModel(
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
    );
  }

  factory WorkoutExerciseLogModel.fromJson(Map<String, dynamic> json) {
    return WorkoutExerciseLogModel(
      sets: json['sets'],
      reps: json['reps'],
      weight: json['weight'],
    );
  }
}
