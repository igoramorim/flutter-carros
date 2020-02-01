import 'package:carros/pages/car/car.dart';
import 'package:carros/pages/car/lorenipsum_api.dart';
import 'package:carros/widgets/text.dart';
import 'package:flutter/material.dart';

class CarPage extends StatefulWidget {
  Car car;

  CarPage(this.car);

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  final _loremIpsumBloc = LoremIpsumBloc();

  @override
  void initState() {
    super.initState();
    _loremIpsumBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car.nome),
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
      child: ListView(
        children: <Widget>[
          Image.network(widget.car.urlFoto),
          _block1(),
          Divider(color: Colors.grey),
          _block2(),
        ],
      ),
    );
  }

  Row _block1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(widget.car.nome, fontSize: 20, bold: true),
            text(
              widget.car.tipo,
              fontSize: 16,
              color: Colors.grey,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 40,
              ),
              onPressed: _onClickFavorite,
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                size: 40,
              ),
              onPressed: _onClickShare,
            ),
          ],
        ),
      ],
    );
  }

  _block2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(widget.car.descricao, fontSize: 16),
        SizedBox(
          height: 15,
        ),
        StreamBuilder<String>(
          stream: _loremIpsumBloc.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return text(snapshot.data, fontSize: 16);
          },
        ),
      ],
    );
  }

  void _onClickMap() {}

  void _onClickVideo() {}

  void _onClickFavorite() {}

  void _onClickShare() {}

  _onClickPopupMenu(String value) {
    switch (value) {
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

  @override
  void dispose() {
    super.dispose();
    _loremIpsumBloc.dispose();
  }

}
