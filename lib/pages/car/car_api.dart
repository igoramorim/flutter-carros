import 'package:carros/pages/car/car.dart';
import 'package:carros/pages/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TypeCar {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarApi {
  static Future<List<Car>> getCars(String type) async {

    User user = await User.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    var url = 'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$type';

    print("GET >> $url");

    var response = await http.get(url, headers: headers);

    print("status code car api: ${response.statusCode}");

    String json = response.body;
    List list = convert.json.decode(json);

    final cars = list.map<Car>((map) => Car.fromJson(map)).toList();

    return cars;
  }
}
