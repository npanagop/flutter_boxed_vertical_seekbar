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
  double _currentHeight;

  initState() {
    super.initState();

    _min = widget.min ?? 0.0;
    _max = widget.max ?? 10.0;
    _step = widget.step ?? 1.0;
    _value = widget.value ?? 5.0;
    _currentHeight = _convertValueToHeight();
  }

  double _convertValueToHeight() {
    return (_value - _min) * widget.height / (_max - _min);
  }

  double _convertHeightToValue(double height) {
    var tempValue = height * (_max - _min) / widget.height + _min;
    if (tempValue != _max && tempValue != _min) {
      tempValue = tempValue - (tempValue % _step) + (_min % _step);
    }
    return tempValue;
  }

  void _onTapUp(TapUpDetails tapDetails) {
    RenderBox renderBox = context.findRenderObject();
    setState(() {
      _currentHeight =
          widget.height - renderBox.globalToLocal(tapDetails.globalPosition).dy;
      _value = _convertHeightToValue(_currentHeight);
    });
    print(_value);
  }

  void _onVerticalDragUpdate(DragUpdateDetails dragDetails) {
    if (dragDetails.primaryDelta >= 1.0  ||  dragDetails.primaryDelta <= -1.0) {
      var newHeight = _currentHeight - dragDetails.primaryDelta;
      if (newHeight > widget.height) {
        newHeight = widget.height;
      } else if (newHeight < 0) {
        newHeight = 0.0;
      }

      if (newHeight != _currentHeight) {
        setState(() {
          _currentHeight = newHeight;
          _value = _convertHeightToValue(_currentHeight);
        });
      }
    }
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
      child: SizedBox(
        width: widget.width,
        height: _currentHeight,
        child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.red)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: _onTapUp,
      onVerticalDragUpdate: _onVerticalDragUpdate,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          _buildFixedBox(),
          _buildMovingBox(),
        ],
      ),
    );
  }
}
