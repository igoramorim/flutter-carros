import 'package:carros/pages/car/car.dart';
import 'package:flutter/material.dart';

class CarPage extends StatelessWidget {
  Car car;
  CarPage(this.car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMap,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: (String value) => _onClickPopupMenu(value),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "Edit",
                  child: Text("Editar"),
                ),
                PopupMenuItem(
                  value: "Delete",
                  child: Text("Deletar"),
                ),
                PopupMenuItem(
                  value: "Share",
                  child: Text("Share"),
                ),
              ];
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Image.network(car.urlFoto),
    );
  }

  void _onClickMap() {}

  void _onClickVideo() {}

  _onClickPopupMenu(String value) {
    switch(value) {
      case "Edit":
        print("editar!!!!");
        break;
      case "Delete":
        print("deletar!!!!");
        break;
      case "Share":
        print("share!!!!");
        break;
    }
  }

}
