import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/localized_field.dart';

part 'timer_and_calender_state.dart';

class TimerAndCalenderCubit extends Cubit<TimerAndCalenderState> {
  TimerAndCalenderCubit() : super(TimerAndCalenderInitial());

  //! Calender Logic
  void loadSelectedValue({required String preferenceKey}) {
    final selectedValueJson =
        getIt<CacheHelper>().getDataString(key: preferenceKey);
    if (selectedValueJson != null) {
      final selectedValue =
          LocalizedField.fromJson(jsonDecode(selectedValueJson));
      emit(DropdownValueState(selectedValue));
    } else {
      emit(DropdownValueState(null));
    }
  }

  void saveSelectedValue(
      {required String preferenceKey, required LocalizedField value}) {
    final valueJson = jsonEncode(value.toJson());
    getIt<CacheHelper>().saveData(key: preferenceKey, value: valueJson);
    emit(DropdownValueState(value));
  }

  //! toggle between calender and timer
  void toggleMode() {
    if (state is TimerOptionsModeState) {
      emit(CalenderModeState());
    } else {
      emit(TimerOptionsModeState());
    }
  }
}
