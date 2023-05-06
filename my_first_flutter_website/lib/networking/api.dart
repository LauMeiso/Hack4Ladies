import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter_website/db/smartphone.dart';

class API {

  final String _smartphoneRoute = "http://localhost/get.php";

  Future<List<Smartphone>> fetchRemoteSmartphones(int offset, int limit, {String search = ""}) async {
    final String url = "$_smartphoneRoute?Auswahl=3&GName=$search&Lim=$limit&OFF=$offset";
    final response = await http
        .get(Uri.parse(url));
    if (response.statusCode == 200) {

      List<dynamic> data = jsonDecode(response.body);
      List<Smartphone> smartphones = [];

      data.forEach((element) => smartphones.add(Smartphone.fromJson(element)));

      return smartphones;
    } else {
      throw Exception('Failed to load smartphones');
    }
  }
}