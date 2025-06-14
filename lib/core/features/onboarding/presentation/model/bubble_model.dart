import 'package:flutter/material.dart';

class BubbleModel {
  final String url;
  final Size? size;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  BubbleModel({
    required this.url,
    this.size,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });
}