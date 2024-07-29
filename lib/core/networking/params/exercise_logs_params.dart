class ExerciseLogsParams {
  int exerciseId;
  int selectedDay;
  int selectedWeek;

  ExerciseLogsParams({
    required this.exerciseId,
    required this.selectedDay,
    required this.selectedWeek,
  });

  Map<String, dynamic> toMap() {
    return {
      'exercise-id': exerciseId,
      'selected-day': selectedDay,
      'selected-week': selectedWeek,
    };
  }
}
