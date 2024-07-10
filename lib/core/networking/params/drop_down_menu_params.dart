class DropDownMenuParams {
  final String day;
  final String week;

  DropDownMenuParams({
    required this.day,
    required this.week,
  });

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'week': week,
    };
  }
}
