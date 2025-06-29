import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerData {
  final String markerId;
  final LatLng markerPosition;
  final String imageUrl;

  MarkerData({
    required this.markerId,
    required this.markerPosition,
    required this.imageUrl,
  });
}
