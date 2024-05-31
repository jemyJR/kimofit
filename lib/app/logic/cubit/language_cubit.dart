import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState(Locale(SavedData.languageCode)));

  void setLocale(Locale locale) {
    SavedData.languageCode = locale.languageCode;
    getIt<CacheHelper>().saveData(
      key: Constants.languageCode,
      value: locale.languageCode,
    );
    emit(LanguageState(locale));
  }
}
