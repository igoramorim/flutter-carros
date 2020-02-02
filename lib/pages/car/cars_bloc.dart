import 'package:carros/pages/car/car.dart';
import 'package:carros/pages/car/car_api.dart';
import 'package:carros/pages/car/simple_bloc.dart';

class CarsBloc extends SimpleBloc<List<Car>> {

  Future<List<Car>> fetch(String type) async {
    try {
      List<Car> cars = await CarApi.getCars(type);
      add(cars);
      return cars;
    } catch(e) {
      addError(e);
    }
  }

}
