library boxed_vertical_seekbar;

import 'package:flutter/material.dart';

import 'boxed_vertical_seekbar.dart';

class MainRoute extends StatefulWidget {
  const MainRoute();

  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  double _value = -1.0;

  void onValueChanged(double newValue) {
    setState(() {
      _value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Boxed Vertical Seekbar'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Top"),
            BoxedVerticalSeekbar(
              height: 400.0,
              width: 150.0,
              onValueChanged: onValueChanged,
            ),
            Text("Bottom"),
            Text(_value.toString()),
          ],
        )
    );
  }
}