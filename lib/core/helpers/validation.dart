import 'package:intl_phone_field/phone_number.dart';
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

String? validatePassword(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return S.of(context).validationPassword;
  }
  return null;
}
