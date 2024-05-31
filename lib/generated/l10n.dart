// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `عربي`
  String get language {
    return Intl.message(
      'عربي',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `You are the only one who can change yourself and I am here to help you\nChange needs a push`
  String get obParagraph1 {
    return Intl.message(
      'You are the only one who can change yourself and I am here to help you\nChange needs a push',
      name: 'obParagraph1',
      desc: '',
      args: [],
    );
  }

  /// `This motivation may be a word you read or hear from me. I always think that you are a special person, but you are missing a simple motivation`
  String get obParagraph2 {
    return Intl.message(
      'This motivation may be a word you read or hear from me. I always think that you are a special person, but you are missing a simple motivation',
      name: 'obParagraph2',
      desc: '',
      args: [],
    );
  }

  /// `Yourself is your biggest enemy\nShe won't tell you to exercise\nShe won't tell you to go on a diet`
  String get obParagraph3 {
    return Intl.message(
      'Yourself is your biggest enemy\nShe won\'t tell you to exercise\nShe won\'t tell you to go on a diet',
      name: 'obParagraph3',
      desc: '',
      args: [],
    );
  }

  /// `Don't lose hope that you will change your body, your health, and your life\nFirst and last, this is your body, this is your health, and you are the decision maker`
  String get obParagraph4 {
    return Intl.message(
      'Don\'t lose hope that you will change your body, your health, and your life\nFirst and last, this is your body, this is your health, and you are the decision maker',
      name: 'obParagraph4',
      desc: '',
      args: [],
    );
  }

  /// `Your reaching your goal is\nas important to me as it is to you. Your shortcomings in some part, even if it is small in relation to you, may be a reason for your development and its lack thereof sometimes.`
  String get obParagraph5 {
    return Intl.message(
      'Your reaching your goal is\nas important to me as it is to you. Your shortcomings in some part, even if it is small in relation to you, may be a reason for your development and its lack thereof sometimes.',
      name: 'obParagraph5',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
