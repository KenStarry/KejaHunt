import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keja_hunt/core/data/repository/shared_prefs_repository.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_type_enum.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/features/users/home/components/house_card_booked.dart';
import 'package:keja_hunt/core/features/users/home/components/house_card_horizontal.dart';
import 'package:keja_hunt/core/features/users/map/presentation/components/custom_user_marker.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

import 'package:widget_to_marker/widget_to_marker.dart';

import '../../../../../di/locator.dart';
import '../../../home/presentation/bloc/units_bloc.dart';

class UserMapPage extends StatefulWidget {
  const UserMapPage({super.key});

  @override
  State<UserMapPage> createState() => _UserMapPageState();
}

class _UserMapPageState extends State<UserMapPage> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  final random = Random();

  static const CameraPosition museumLatLng = CameraPosition(
    target: LatLng(-1.2727176250697454, 36.8147413638215),
    zoom: 14,
  );

  static const CameraPosition userPostion = CameraPosition(
    target: LatLng(-1.2741162286078513, 36.82371509887672),
    zoom: 14,
  );

  final Set<Marker> markers = {};
  String? mapStyle;

  bool isLoaded = false;
  double zoom = 18;
  double tilt = 45;
  double bearing = 0;

  @override
  void initState() {
    super.initState();
  }

  Future<void> initMarkers({
    required List<Map<String, dynamic>> markerData,
  }) async {
    // final List<Map<String, dynamic>> markerData = [
    //   {
    //     'id': '1',
    //     'position': LatLng(-1.2727176250697454, 36.8147413638215),
    //     'imageUrl':
    //         'https://images.unsplash.com/photo-1664372623516-0b1540d6771e?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    //   },
    //   {
    //     'id': '2',
    //     'position': LatLng(-1.2754635283483071, 36.83396743804028),
    //     'imageUrl':
    //         'https://images.unsplash.com/photo-1668438712649-ffd85f756de5?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    //   },
    //   {
    //     'id': '3',
    //     'position': LatLng(-1.2861038744716342, 36.81903289779614),
    //     'imageUrl':
    //         'https://images.unsplash.com/photo-1670244208732-fcc8cbd17045?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    //   },
    //   // Add more markers here
    // ];

    // Convert each image into a marker loading Future
    List<Future<Marker>> markerFutures = markerData.map((data) async {
      final imageProvider = CachedNetworkImageProvider(data['imageUrl']);

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
        markerId: MarkerId(data['id']),
        position: data['position'],
        icon: markerIcon,
      );
    }).toList();

    // Wait for all marker futures to resolve
    final loadedMarkers = await Future.wait(markerFutures);

    markers.addAll(loadedMarkers);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UnitsBloc, UnitsState>(
      listener: (context, unitsState) async {
        if (unitsState is UnitsSuccess) {
          await initMarkers(
            markerData: unitsState.allUnits
                .map(
                  (unit) =>
              {
                'id': unit.unitId,
                'position': LatLng(
                  -1.2727176250697454,
                  36.8147413638215,
                ),
                'imageUrl':
                unit.images[random.nextInt(unit.images.length)]
                    .imageUrl,
              },
            )
                .toList(),
          );
        }
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: museumLatLng,
              mapType: MapType.normal,
              style: locator
                  .get<SharedPrefsRepository>()
                  .getMapStyles()['light-map'],
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              onMapCreated: (controller) =>
                  _controller.complete(controller),
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                ),
              },
              onCameraMove: (CameraPosition cameraPosition) {
                setState(() {
                  zoom = cameraPosition.zoom;
                  tilt = cameraPosition.tilt;
                  bearing = cameraPosition.bearing;
                });
              },
              markers: markers,
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 120, left: 20, right: 20),
                child: HouseCardHorizontal(
                  houseUnitModel: HouseUnitModel(
                    apartmentId: "2",
                    unitType: UnitTypeEnum.oneBr.name,
                    images: [
                      UnitImageModel(
                        imageUrl:
                        "https://images.unsplash.com/photo-1670244208732-fcc8cbd17045?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                    ],
                    price: 32900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
