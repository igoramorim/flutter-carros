import 'dart:async';

import 'package:carros/pages/car/car.dart';
import 'package:carros/pages/car/car_api.dart';

class CarsBlock {

  final _streamController = StreamController<List<Car>>();
  Stream<List<Car>> get stream => _streamController.stream;

  fetch(String type) async {
    List<Car> cars = await CarApi.getCars(type);
    if (!_streamController.isClosed) {
    _streamController.add(cars);
    }
  }

  void dispose() {
    _streamController.close();
  }

}
