import 'package:carros/pages/car/car.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TypeCar {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarApi {
  static Future<List<Car>> getCars(String type) async {

    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$type';

    var response = await http.get(url);

    String json = response.body;
    List list = convert.json.decode(json);

    final cars = list.map<Car>((map) => Car.fromJson(map)).toList();

    return cars;
  }
}
