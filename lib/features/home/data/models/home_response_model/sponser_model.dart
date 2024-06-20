import 'package:kimofit/core/networking/api/api_endpoints.dart';

class SponserModel {
  final int id;
  final String name;
  final String image;
  final String link;

  SponserModel({
    required this.id,
    required this.name,
    required this.image,
    required this.link,
  });

  factory SponserModel.fromJson(Map<String, dynamic> json) {
    return SponserModel(
      id: json[ApiKey.sponserId],
      name: json[ApiKey.sponserName],
      image: json[ApiKey.sponserImage],
      link: json[ApiKey.sponserLink],
    );
  }
}
