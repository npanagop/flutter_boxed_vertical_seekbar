import 'package:flutter/material.dart';

import 'main_route.dart';

void main() => runApp(BoxedVerticalSeekbarApp());

class BoxedVerticalSeekbarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boxed Vertical Seekbar',
      home: MainRoute(),
    );
  }
}
