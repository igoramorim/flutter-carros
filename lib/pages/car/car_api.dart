import 'package:carros/pages/car/car.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CarApi {
  static Future<List<Car>> getCars() async {

    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros';

    var response = await http.get(url);

    String json = response.body;
    List list = convert.json.decode(json);

    final cars = List<Car>();

    for(Map map in list) {
      Car c = Car.fromJson(map);
      cars.add(c);
    }

    return cars;
  }
}
