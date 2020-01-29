import 'package:carros/drawer_list.dart';
import 'package:carros/pages/car/car_api.dart';
import 'package:carros/pages/car/car_listview.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Clássicos",
              ),
              Tab(
                text: "Esportivos",
              ),
              Tab(
                text: "Luxo",
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CarListView(TypeCar.classicos),
          CarListView(TypeCar.esportivos),
          CarListView(TypeCar.luxo),
        ],),
        drawer: DrawerList(),
      ),
    );
  }
}
