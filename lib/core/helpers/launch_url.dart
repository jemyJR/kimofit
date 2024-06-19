import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $urlString';
  }
}
