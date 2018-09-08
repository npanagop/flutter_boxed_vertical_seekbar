library boxed_vertical_seekbar;

import 'package:flutter/material.dart';

class BoxedVerticalSeekbar extends StatefulWidget {
  final double width;
  final double height;
  const BoxedVerticalSeekbar({
    Key key, @required this.height, @required this.width
  }) : super(key: key);
  
  _BoxedVerticalSeekbarState createState() => _BoxedVerticalSeekbarState();
}

class _BoxedVerticalSeekbarState extends State<BoxedVerticalSeekbar> {

  double _value;

  initState() {
    super.initState();
    _value = widget.height;
  }

  double _calculateHeight() {
    return _value;
  }

  Widget _buildFixedBox() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.black54),
      ),
    );
  }

  Widget _buildMovingBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onVerticalDragUpdate: (d) {
          //print (d.primaryDelta);
          if (d.primaryDelta >= 1.0  ||  d.primaryDelta <= -1.0) {
            var newValue = _value -d.primaryDelta;
            if (newValue > widget.height) newValue = widget.height;
            if (newValue < 0) newValue = 0.0;
            setState(() {
              _value = newValue;
            });
          }
        },
        child: SizedBox(
          width: widget.width,
          height: _calculateHeight(),
          child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red)
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        _buildFixedBox(),
        _buildMovingBox()
      ],
    );
  }
}
