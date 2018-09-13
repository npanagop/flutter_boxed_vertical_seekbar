library boxed_vertical_seekbar;

import 'package:flutter/material.dart';

import 'package:boxed_vertical_seekbar/boxed_vertical_seekbar.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BoxedVerticalSeekBar(
              height: 400.0,
              width: 150.0,
              onValueChanged: onValueChanged,
              accuracy: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _value.toString(),
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ],
        )
    );
  }
}