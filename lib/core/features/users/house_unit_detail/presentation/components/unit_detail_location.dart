import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/features/users/map/presentation/components/google_map_component.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/utils/constants/constants.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../home/presentation/bloc/units_bloc.dart';
import '../../../map/presentation/model/marker_data.dart';

class UnitDetailLocation extends StatefulWidget {
  final HouseUnitModel houseUnitModel;

  const UnitDetailLocation({super.key, required this.houseUnitModel});

  @override
  State<UnitDetailLocation> createState() => _UnitDetailLocationState();
}

class _UnitDetailLocationState extends State<UnitDetailLocation> {

  final random = Random();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: horizontalPadding),
      sliver: MultiSliver(
        children: [
          /// Title
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Location", style: Theme.of(context).textTheme.titleSmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    SvgPicture.asset(
                      "assets/images/icons/location_filled.svg",
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      widget.houseUnitModel.apartment?.location ??
                          'Unknown location',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: grey700),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),

          /// Map Component
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: AspectRatio(
                aspectRatio: 3 / 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: BlocBuilder<UnitsBloc, UnitsState>(
                    builder: (context, unitsState) {
                      return GoogleMapComponent(
                        initialPosition: CameraPosition(
                          target: LatLng(
                            widget.houseUnitModel.apartment?.latitude ?? 0,
                            widget.houseUnitModel.apartment?.longitude ?? 0,
                          ),
                          zoom: 14,
                        ),
                        enableScroll: false,
                        markerData: [
                          MarkerData(
                            markerId: widget.houseUnitModel.unitId,
                            markerPosition: LatLng(
                              widget.houseUnitModel.apartment?.latitude ?? 0,
                              widget.houseUnitModel.apartment?.longitude ?? 0,
                            ),
                            imageUrl: widget
                                .houseUnitModel
                                .images[random.nextInt(
                                  widget.houseUnitModel.images.length,
                                )]
                                .imageUrl,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
