import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_model.dart';

class api_helper {
  api_helper._();

  static api_helper api = api_helper._();

  Future getdata({required String search}) async {
    var ans = await http.get(
      Uri.parse(
          "https://api.weatherapi.com/v1/forecast.json?key=24e065aab8fa4fa08b245306232208&q=$search&days=1&aqi=no&alerts=no"),
    );
    if (ans.statusCode == 200) {
      var body = ans.body;
      Map decodegata = jsonDecode(body);
      api_model data = api_model.js(data: decodegata);
      return data;
    } else {
      return null;
    }
  }
}
