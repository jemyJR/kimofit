import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState(Locale('ar'))) {
    _loadInitialLanguage();
  }
  Future<void> _loadInitialLanguage() async {
    final languageCode =
        await getIt<CacheHelper>().getData(key: Constants.languageCode) ?? 'ar';
    emit(LanguageState(Locale(languageCode)));
  }

  void setLocale(Locale locale) {
    getIt<CacheHelper>().saveData(
      key: Constants.languageCode,
      value: locale.languageCode,
    );
    emit(LanguageState(locale));
  }
}
