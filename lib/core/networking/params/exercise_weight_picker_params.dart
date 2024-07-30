class ExerciseWeightPickerParams {
  final int exerciseId;
  final int selectedDay;
  final int selectedWeek;
  final int weightIndex;
  final int newWeight;

  ExerciseWeightPickerParams({
    required this.exerciseId,
    required this.selectedDay,
    required this.selectedWeek,
    required this.weightIndex,
    required this.newWeight,
  });

  Map<String, dynamic> toMap() {
    return {
      'exercise-id': exerciseId,
      'selected-day': selectedDay,
      'Selected-week': selectedWeek,
      'weight-index': weightIndex,
      'new-weight': newWeight,
    };
  }
}
