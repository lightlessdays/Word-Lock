import 'dart:convert';
import 'package:dictionary/fetch/constants.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future<List<dynamic>> fetchData(String word, String apiKey) async {
  var result = await http.get(Uri.parse(fetchURL(word, apiKey)));
  return (jsonDecode(result.body));
}

Future<void> launchUrlInBrowser(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
