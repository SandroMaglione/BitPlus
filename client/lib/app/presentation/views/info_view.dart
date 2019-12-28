import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('Developed by'),
          Text('Sandro Maglione'),
          Text('sandromaglione.com'),
        ],
      ),
    );
  }
}