import 'package:carros/drawer_list.dart';
import 'package:carros/pages/car/car_api.dart';
import 'package:carros/pages/car/car_listview.dart';
import 'package:carros/pages/car/cars_page.dart';
import 'package:carros/utils/prefs.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin<Homepage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _initTabs();
  }

  _initTabs() async {
    _tabController = TabController(length: 3, vsync: this);

    int tabIdx = await Prefs.getInt("tabIdx");
    _tabController.index = tabIdx;

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        bottom: TabBar(
          controller: _tabController,
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
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CarsPage(TypeCar.classicos),
          CarsPage(TypeCar.esportivos),
          CarsPage(TypeCar.luxo),
        ],
      ),
      drawer: DrawerList(),
    );
  }
}
