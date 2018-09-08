import 'package:flutter/material.dart';

import 'boxed_vertical_seekbar.dart';

void main() => runApp(BoxedVerticalSeekbarApp());

class BoxedVerticalSeekbarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boxed Vertical Seekbar',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Boxed Vertical Seekbar'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Top"),
            BoxedVerticalSeekbar(height: 400.0, width: 150.0,),
            Text("Bottom"),
          ],
        )
      ),
    );
  }
}
