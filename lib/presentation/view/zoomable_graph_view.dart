import 'dart:math';

import 'package:flutter/material.dart';

class ZoomableGraphView extends StatefulWidget {
  final double maxX;
  final double minX;
  final double minZoomLevel;
  final double maxZoomLevel;
  final Widget Function(double, double) builder;

  const ZoomableGraphView({
    super.key,
    required this.maxX,
    required this.minX,
    required this.builder,
    this.minZoomLevel = 0.5,
    this.maxZoomLevel = 2.0,
  });

  @override
  State<ZoomableGraphView> createState() => _ZoomableGraphViewState();
}

class _ZoomableGraphViewState extends State<ZoomableGraphView> {
  late double _minX;
  late double _maxX;
  bool _isZooming = true;

  @override
  void initState() {
    super.initState();
    _minX = widget.minX;
    _maxX = widget.maxX;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _isZooming ? null : _dragHorizontal,
      onDoubleTap: _resetZoom,
      onScaleStart: (details) => setZooming(true),
      onScaleEnd: (details) => setZooming(false),
      onScaleUpdate: _zoom,
      child: widget.builder(_minX, _maxX),
    );
  }

  void setZooming(bool isZooming) {
    setState(() {
      _isZooming = isZooming;
    });
  }

  void _dragHorizontal(DragUpdateDetails details) {
    setState(() {
      final horizontalDistance = details.primaryDelta ?? 0;
      if (horizontalDistance == 0) return;

      final lastMinMaxDistance = max(_maxX - _minX, 0.0);
      final moveDistance = lastMinMaxDistance * 0.5 * horizontalDistance;
      double newMinX = _minX - moveDistance;
      double newMaxX = _maxX - moveDistance;

      if (newMinX < widget.minX) {
        newMinX = widget.minX;
        newMaxX = newMinX + lastMinMaxDistance;
      }

      if (newMaxX > widget.maxX) {
        newMaxX = widget.maxX;
        newMinX = newMaxX - lastMinMaxDistance;
      }

      _minX = newMinX;
      _maxX = newMaxX;
    });
  }

  void _zoom(ScaleUpdateDetails details) {
    final scale = details.horizontalScale;
    if (scale == 1.0) return;

    // 확대/축소 비율 보정
    final adjustedScale =
        (1 + (scale - 1) * 0.5).clamp(widget.minZoomLevel, widget.maxZoomLevel); // 최소 0.5, 최대 2.0으로 제한

    setState(() {
      final focalPointX = details.localFocalPoint.dx;

      // 현재 뷰의 가로 길이를 계산
      final viewWidth = context.size!.width;

      // 뷰의 가로 길이 대비 핀치한 지점의 비율 계산
      final focalRatio = focalPointX / viewWidth;

      // 확대/축소의 중심을 계산
      final focalX = _minX + (_maxX - _minX) * focalRatio;

      // 새로운 minX, maxX 계산
      final newMinX = focalX - (focalX - _minX) / adjustedScale;
      final newMaxX = focalX + (_maxX - focalX) / adjustedScale;

      _minX = max(widget.minX, newMinX);
      _maxX = min(widget.maxX, newMaxX);
    });
  }

  void _resetZoom() {
    setState(() {
      _minX = widget.minX;
      _maxX = widget.maxX;
      _isZooming = true;
    });
  }
}
