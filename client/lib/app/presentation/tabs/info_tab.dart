import 'package:flutter/material.dart';

class InfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const <Widget>[
          Text('Developed by'),
          Text('Sandro Maglione'),
          Text('sandromaglione.com'),
        ],
      ),
    );
  }
}
