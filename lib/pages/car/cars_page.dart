import 'package:carros/pages/car/car.dart';
import 'package:carros/pages/car/car_listview.dart';
import 'package:carros/pages/car/cars_bloc.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';

class CarsPage extends StatefulWidget {
  String type;
  CarsPage(this.type);

  @override
  _CarListViewState createState() => _CarListViewState();
}

class _CarListViewState extends State<CarsPage>
    with AutomaticKeepAliveClientMixin<CarsPage> {
  List<Car> cars;

  String get type => widget.type;

  final _bloc = CarsBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _bloc.fetch(type);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError("Não foi possível buscar os carros");
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Car> cars = snapshot.data;
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CarListView(cars),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.fetch(type);
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

}
