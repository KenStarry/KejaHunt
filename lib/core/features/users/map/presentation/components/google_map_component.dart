import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keja_hunt/core/features/users/map/presentation/model/marker_data.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../../../../../data/repository/shared_prefs_repository.dart';
import '../../../../../di/locator.dart';
import 'custom_user_marker.dart';

class GoogleMapComponent extends StatefulWidget {
  final List<MarkerData> markerData;
  final bool enableScroll;
  final CameraPosition initialPosition;

  const GoogleMapComponent({
    super.key,
    required this.markerData,
    this.enableScroll = true,
    required this.initialPosition,
  });

  @override
  State<GoogleMapComponent> createState() => _GoogleMapComponentState();
}

class _GoogleMapComponentState extends State<GoogleMapComponent> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final Set<Marker> _markers = {};
  double zoom = 18;
  double tilt = 45;
  double bearing = 0;

  Future<void> initMarkers({required List<MarkerData> markerData}) async {
    // Convert each image into a marker loading Future
    List<Future<Marker>> markerFutures = markerData.map((data) async {
      final imageProvider = CachedNetworkImageProvider(data.imageUrl);

      final completer = Completer<ImageInfo>();
      final stream = imageProvider.resolve(const ImageConfiguration());

      stream.addListener(
        ImageStreamListener(
          (ImageInfo info, bool _) {
            completer.complete(info);
          },
          onError: (dynamic error, StackTrace? stackTrace) {
            completer.completeError(error, stackTrace);
          },
        ),
      );

      final imageInfo = await completer.future;

      final byteData = await imageInfo.image.toByteData(
        format: ImageByteFormat.png,
      );
      final bytes = byteData!.buffer.asUint8List();

      /// Create the Marker Icon but don't use network image for this.
      final icon = await CustomUserMarker(bytes: bytes).toBitmapDescriptor();

      // final markerIcon = BitmapDescriptor.fromBytes(bytes);
      final markerIcon = icon;

      return Marker(
        markerId: MarkerId(data.markerId),
        position: data.markerPosition,
        icon: markerIcon,
      );
    }).toList();

    // Wait for all marker futures to resolve
    final loadedMarkers = await Future.wait(markerFutures);

    _markers.addAll(loadedMarkers);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initMarkers(markerData: widget.markerData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: GoogleMap(
        initialCameraPosition: widget.initialPosition,
        mapType: MapType.normal,
        style: locator.get<SharedPrefsRepository>().getMapStyles()['light-map'],
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: widget.enableScroll,
        rotateGesturesEnabled: true,
        tiltGesturesEnabled: true,
        onMapCreated: (controller) => _controller.complete(controller),
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
          Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
        },
        onCameraMove: (CameraPosition cameraPosition) {
          setState(() {
            zoom = cameraPosition.zoom;
            tilt = cameraPosition.tilt;
            bearing = cameraPosition.bearing;
          });
        },
        markers: _markers,
      ),
    );
  }
}
