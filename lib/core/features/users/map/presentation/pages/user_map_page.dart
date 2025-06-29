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
import 'package:keja_hunt/core/features/users/map/presentation/components/google_map_component.dart';
import 'package:keja_hunt/core/features/users/map/presentation/model/marker_data.dart';
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

  final random = Random();

  static const CameraPosition museumLatLng = CameraPosition(
    target: LatLng(-1.2727176250697454, 36.8147413638215),
    zoom: 14,
  );

  static const CameraPosition userPostion = CameraPosition(
    target: LatLng(-1.2741162286078513, 36.82371509887672),
    zoom: 14,
  );
  String? mapStyle;

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UnitsBloc, UnitsState>(
      listener: (context, unitsState) async {
        if (unitsState is UnitsSuccess) {
          // await initMarkers(
          //   markerData: unitsState.allUnits
          //       .map(
          //         (unit) => {
          //           'id': unit.unitId,
          //           'position': LatLng(-1.2727176250697454, 36.8147413638215),
          //           'imageUrl': unit
          //               .images[random.nextInt(unit.images.length)]
          //               .imageUrl,
          //         },
          //       )
          //       .toList(),
          // );
        }
      },
      builder: (BuildContext context, UnitsState unitsState) => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            GoogleMapComponent(
              initialPosition: museumLatLng,
              markerData: unitsState is UnitsSuccess
                  ? unitsState.allUnits
                        .map(
                          (unit) => MarkerData(
                            markerId: unit.unitId,
                            markerPosition: LatLng(
                              unit.apartment?.latitude ?? 0,
                              unit.apartment?.longitude ?? 0,
                            ),
                            imageUrl: unit
                                .images[random.nextInt(unit.images.length)]
                                .imageUrl,
                          ),
                        )
                        .toList()
                  : <MarkerData>[],
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
