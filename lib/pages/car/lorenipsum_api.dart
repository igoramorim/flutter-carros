import 'dart:async';
import 'package:carros/pages/car/simple_bloc.dart';
import 'package:http/http.dart' as http;

class LoremIpsumBloc extends SimpleBloc<String> {

  static String loren;

  fetch() async {
    try {
      String text = loren ?? await LoremIpsumApi.get();
      loren = text;
      add(text);
    } catch(e) {
      addError(e);
    }
  }

}

class LoremIpsumApi {
  static Future<String> get() async {

    var url = "https://loripsum.net/api";

    print("GET > $url");

    var response = await http.get(url);

    String text = response.body;

    text = text.replaceAll("<p>", "");
    text = text.replaceAll("</p>", "");

    return text;

  }
}
