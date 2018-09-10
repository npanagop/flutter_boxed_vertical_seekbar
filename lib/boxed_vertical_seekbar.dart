library boxed_vertical_seekbar;

import 'package:flutter/material.dart';

class BoxedVerticalSeekbar extends StatefulWidget {
  final double width;
  final double height;
  final double min;
  final double max;
  final double step;
  final double value;
  const BoxedVerticalSeekbar({
    Key key,
    @required this.height,
    @required this.width,
    this.max,
    this.min,
    this.step,
    this.value,
  }) : super(key: key);
  
  _BoxedVerticalSeekbarState createState() => _BoxedVerticalSeekbarState();
}

class _BoxedVerticalSeekbarState extends State<BoxedVerticalSeekbar> {
  double _value;
  double _min;
  double _max;
  double _step;

  initState() {
    super.initState();

    _min = widget.min ?? 0.0;
    _max = widget.max ?? 10.0;
    _step = widget.step ?? 1.0;

    _value = 1.0;
  }

  double _convertValueToHeight() {
    print ((_value - _min) * widget.height / (_max - _min));
    return (_value - _min) * widget.height / (_max - _min);
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
          /*if (d.primaryDelta >= 1.0  ||  d.primaryDelta <= -1.0) {
            var newValue = widget.value - d.primaryDelta;
            if (newValue > widget.height) newValue = widget.height;
            if (newValue < 0) newValue = 0.0;
            setState(() {
              _value = newValue;
            });
          }*/
        },
        child: SizedBox(
          width: widget.width,
          height: _convertValueToHeight(),
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
