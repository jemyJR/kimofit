import 'package:flutter/material.dart';

class HomeCardCategoryArguments {
  final String routeName;
  final dynamic arguments;
  final bool badged;
  final String badgedText;
  final Color badgeColor;
  final bool locked;
  final bool colorFiltered;

  HomeCardCategoryArguments({
    required this.routeName,
    required this.arguments,
    required this.badged,
    required this.badgedText,
    required this.badgeColor,
    required this.locked,
    required this.colorFiltered,
  });

  HomeCardCategoryArguments copyWith({
    String? routeName,
    dynamic arguments,
    bool? badged,
    String? badgedText,
    Color? badgeColor,
    bool? locked,
    bool? colorFiltered,
  }) {
    return HomeCardCategoryArguments(
      routeName: routeName ?? this.routeName,
      arguments: arguments ?? this.arguments,
      badged: badged ?? this.badged,
      badgedText: badgedText ?? this.badgedText,
      badgeColor: badgeColor ?? this.badgeColor,
      locked: locked ?? this.locked,
      colorFiltered: colorFiltered ?? this.colorFiltered,
    );
  }
}
