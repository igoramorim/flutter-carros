import 'package:carros/pages/car/car.dart';
import 'package:carros/pages/car/car_api.dart';
import 'package:carros/pages/car/car_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class CarListView extends StatefulWidget {
  
  String type;
  CarListView(this.type);

  @override
  _CarListViewState createState() => _CarListViewState();
}

class _CarListViewState extends State<CarListView> with AutomaticKeepAliveClientMixin<CarListView> {
  
  List<Car> cars;
  
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    Future<List<Car>> future = CarApi.getCars(widget.type);
    future.then((List<Car> cars) {
      setState(() {
        this.cars = cars;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (cars == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return _listView(cars);
  }

  Container _listView(List<Car> cars) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: cars != null ? cars.length : 0,
        itemBuilder: (context, index) {
          Car c = cars[index];
          return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      c.urlFoto ?? "http://www.livroandroid.com.br/livro/carros/esportivos/MERCEDES_BENZ_AMG.png",
                      width: 250,
                    ),
                  ),
                  Text(
                    c.nome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    "descrição...",
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('DETALHES'),
                        onPressed: () => _onClickCar(c),
                      ),
                      FlatButton(
                        child: const Text('SHARE'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _onClickCar(Car c) {
    push(context, CarPage(c));
  }

}
