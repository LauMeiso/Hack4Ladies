import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter_website/db/smartphone.dart';

class API {

  final String _smartphoneRoute = "http://localhost/get.php";

  Future<List<Smartphone>> fetchRemoteSmartphones() async {
    final response = await http
        .get(Uri.parse(_smartphoneRoute));
    print("Jasses fetch");
    if (response.statusCode == 200) {

      List<dynamic> data = jsonDecode(response.body);
      List<Smartphone> smartphones = [];

      data.forEach((element) => smartphones.add(Smartphone.fromJson(element)));

      print("Jasses ${smartphones.first.name}");
      return smartphones;
    } else {
      throw Exception('Failed to load characters');
    }
  }
}