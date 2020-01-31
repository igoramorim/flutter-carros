import 'dart:async';

import 'package:carros/pages/car/car.dart';
import 'package:carros/pages/car/car_api.dart';

class CarsBloc {

  final _streamController = StreamController<List<Car>>();
  Stream<List<Car>> get stream => _streamController.stream;

  fetch(String type) async {
    try {
      List<Car> cars = await CarApi.getCars(type);
      if (!_streamController.isClosed) {
        _streamController.add(cars);
      }
    } catch(e) {
      _streamController.addError(e);
    }
  }

  void dispose() {
    _streamController.close();
  }

}
