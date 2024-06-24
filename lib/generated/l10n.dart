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

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Log in to your account`
  String get loginMessage {
    return Intl.message(
      'Log in to your account',
      name: 'loginMessage',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Are you a new user ?`
  String get newUser {
    return Intl.message(
      'Are you a new user ?',
      name: 'newUser',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Search Country`
  String get searchCountry {
    return Intl.message(
      'Search Country',
      name: 'searchCountry',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get validationPhone {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'validationPhone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get validationPassword {
    return Intl.message(
      'Please enter a password',
      name: 'validationPassword',
      desc: '',
      args: [],
    );
  }

  /// `This field can't be empty`
  String get validationEmptyField {
    return Intl.message(
      'This field can\'t be empty',
      name: 'validationEmptyField',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a phone number`
  String get validationPhoneEmptyField {
    return Intl.message(
      'Please enter a phone number',
      name: 'validationPhoneEmptyField',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get validationPasswordLength {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'validationPasswordLength',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid name`
  String get validationName {
    return Intl.message(
      'Please enter a valid name',
      name: 'validationName',
      desc: '',
      args: [],
    );
  }

  /// `Are you  current user ?`
  String get currentUser {
    return Intl.message(
      'Are you  current user ?',
      name: 'currentUser',
      desc: '',
      args: [],
    );
  }

  /// `You have been logged in successfully`
  String get loggedInSuccessfully {
    return Intl.message(
      'You have been logged in successfully',
      name: 'loggedInSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `You have been signed up successfully`
  String get signUpSuccessfully {
    return Intl.message(
      'You have been signed up successfully',
      name: 'signUpSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Create your account now to enjoy a unique experience`
  String get signupMessage {
    return Intl.message(
      'Create your account now to enjoy a unique experience',
      name: 'signupMessage',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `We hope you are well`
  String get homeWelcomeMessage {
    return Intl.message(
      'We hope you are well',
      name: 'homeWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message(
      'End',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Sponsor`
  String get Sponsor {
    return Intl.message(
      'Sponsor',
      name: 'Sponsor',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get free {
    return Intl.message(
      'Free',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Trainee`
  String get trainee {
    return Intl.message(
      'Trainee',
      name: 'trainee',
      desc: '',
      args: [],
    );
  }

  /// `You have reached the end of your subscription!!\nPlease renew your subscription to continue using the app.`
  String get subscriptionEndMessage {
    return Intl.message(
      'You have reached the end of your subscription!!\nPlease renew your subscription to continue using the app.',
      name: 'subscriptionEndMessage',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `You have been logged out successfully`
  String get loggedOutSuccessfully {
    return Intl.message(
      'You have been logged out successfully',
      name: 'loggedOutSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Subscription`
  String get subscription {
    return Intl.message(
      'Subscription',
      name: 'subscription',
      desc: '',
      args: [],
    );
  }

  /// `This feature is available to subscribed users only. Please upgrade your account by contacting us to enjoy all the features`
  String get SubscriptionMessage {
    return Intl.message(
      'This feature is available to subscribed users only. Please upgrade your account by contacting us to enjoy all the features',
      name: 'SubscriptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `are very important for the following reasons:`
  String get SubscriptionFeatures {
    return Intl.message(
      'are very important for the following reasons:',
      name: 'SubscriptionFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Contact me for details`
  String get contactme {
    return Intl.message(
      'Contact me for details',
      name: 'contactme',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get length {
    return Intl.message(
      'Length',
      name: 'length',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `KG`
  String get kg {
    return Intl.message(
      'KG',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `CM`
  String get cm {
    return Intl.message(
      'CM',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `Subscription Details`
  String get subscriptionDetails {
    return Intl.message(
      'Subscription Details',
      name: 'subscriptionDetails',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Coaching Duration`
  String get coachingDuration {
    return Intl.message(
      'Coaching Duration',
      name: 'coachingDuration',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change your password now`
  String get changePasswordMessage {
    return Intl.message(
      'Change your password now',
      name: 'changePasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, an error occurred, you have to log in again`
  String get tokenExpiredMessage {
    return Intl.message(
      'Sorry, an error occurred, you have to log in again',
      name: 'tokenExpiredMessage',
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
