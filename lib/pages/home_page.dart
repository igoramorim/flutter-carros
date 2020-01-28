import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text(
        "Igor",
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}
