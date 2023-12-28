import 'package:flutter/material.dart';

class MyZoom extends StatefulWidget {
  final Widget child;
  const MyZoom({super.key, required this.child});

  @override
  State<MyZoom> createState() => _MyZoomState();
}

class _MyZoomState extends State<MyZoom> {
  double _scale = 1.0;
  Offset _offset = Offset.zero;
  Offset _startOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onScaleStart: (details) {
          _startOffset = details.focalPoint - _offset;
        },
        onScaleUpdate: (details) {
          setState(() {
            _scale = details.scale;
            _offset = details.focalPoint - _startOffset;
          });
        },
        child: Transform(
          transform: Matrix4.identity()
            ..translate(_offset.dx, _offset.dy)
            ..scale(_scale),
          child: widget.child,
        ),
      ),
    );
  }
}
