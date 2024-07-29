import 'package:flutter_bloc/flutter_bloc.dart';

part 'exercise_log_state.dart';

class ExerciseLogCubit extends Cubit<ExerciseLogState> {
  ExerciseLogCubit() : super(ExerciseLogTableState());

  void showTable() => emit(ExerciseLogTableState());

  void showWeightPicker(String existingWeight) =>
      emit(ExerciseWeightPickerState(existingWeight));
}
