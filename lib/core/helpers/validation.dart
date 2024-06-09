import 'package:intl_phone_field/phone_number.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:flutter/material.dart';

String? validatePhone(BuildContext context, PhoneNumber? value) {
  if (value == null ||
      value.number.isEmpty ||
      value.completeNumber.length < 4) {
    return S.of(context).validationPhone;
  }
  return null;
}

bool validateEgyPhone(BuildContext context, String value) {
  String pattern = r'^\+2(010|011|012|015)\d{8}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

String? validatePassword(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return S.of(context).validationEmptyField;
  }
  if (value.length < 8) {
    return S.of(context).validationPasswordLength;
  }
  return null;
}

String? validateName(BuildContext context, String? value) {
  // Pattern to match Arabic and English letters and spaces, but not digits
  String pattern = r'^[a-zA-Z\u0600-\u06FF\s]+$';
  RegExp regExp = RegExp(pattern);

  if (value.isNullOrEmpty()) {
    return S.of(context).validationEmptyField;
  }
  if (!regExp.hasMatch(value!)) {
    return S.of(context).validationName;
  }

  return null;
}
