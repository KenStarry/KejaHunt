import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keja_hunt/core/utils/routing/app_router.dart';

Future<BitmapDescriptor> widgetToMarkerBitmapDescriptor(Widget widget, {Size size = const Size(100, 100)}) async {
  final repaintBoundaryKey = GlobalKey();

  // Create an overlay entry off-screen
  final completer = Completer<BitmapDescriptor>();
  final overlayEntry = OverlayEntry(
    builder: (_) => Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Positioned(
            left: -9999,
            top: -9999,
            width: size.width,
            height: size.height,
            child: RepaintBoundary(
              key: repaintBoundaryKey,
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: widget,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  // Insert into overlay
  Overlay.of(rootNavigatorKey.currentContext!, rootOverlay: true)!.insert(overlayEntry);

  // Wait for a frame to allow rendering
  await Future.delayed(const Duration(milliseconds: 100));

  final boundary = repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  final image = await boundary.toImage(pixelRatio: 3.0);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  final pngBytes = byteData!.buffer.asUint8List();

  overlayEntry.remove();

  return BitmapDescriptor.bytes(pngBytes);
}
