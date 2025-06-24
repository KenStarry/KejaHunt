import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_filled_button.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../domain/enum/units/unit_feature_groups_enum.dart';
import '../../../domain/enum/units/unit_feature_level_enum.dart';
import '../../../features/users/house_unit_detail/presentation/components/unit_feature_vertical.dart';
import '../../../utils/constants/unit_constants.dart';

class AmenitiesBottomsheet extends StatefulWidget {
  final Function(List<UnitFeatureModel> selectedFeatures) onSave;
  final List<UnitFeatureModel>? alreadySelectedFeatures;

  const AmenitiesBottomsheet({
    super.key,
    required this.alreadySelectedFeatures,
    required this.onSave,
  });

  @override
  State<AmenitiesBottomsheet> createState() => _AmenitiesBottomsheetState();
}

class _AmenitiesBottomsheetState extends State<AmenitiesBottomsheet> {
  List<UnitFeatureModel> selectedFeatures = [];
  List<UnitFeatureModel> allFeaturesMapped = [...allFeatures];

  @override
  void initState() {
    super.initState();

    if (widget.alreadySelectedFeatures != null &&
        widget.alreadySelectedFeatures!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          selectedFeatures.addAll(widget.alreadySelectedFeatures!);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.screenHeight * 0.65,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(44),
          topLeft: Radius.circular(44),
        ),
      ),
      child: Stack(
        children: [
          Column(
            spacing: 12,
            children: [
              Text(
                "Select Amenities",
                style: Theme.of(context).textTheme.titleMedium,
              ),

              SizedBox(
                width: double.infinity,
                height: 80,
                child: ListView.separated(
                  itemBuilder: (context, index) => UnitFeatureVertical(
                    featureModel: selectedFeatures.sortByAndReturnSorted(
                      (feat) => feat.featureName,
                    )[index],
                  ),
                  itemCount: selectedFeatures
                      .sortByAndReturnSorted((feat) => feat.featureName)
                      .length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(width: 16),
                ),
              ),

              Divider(thickness: 1, color: grey200),

              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    /// features section
                    MultiSliver(children: []),

                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final currentFeature = allFeaturesMapped
                              .sortByAndReturnSorted(
                                (feature) => feature.featureName,
                              )
                              .where(
                                (feature) =>
                                    feature.featureGroup ==
                                        UnitFeatureGroupsEnum.insideUnit.name &&
                                    feature.featureLevel ==
                                        UnitFeatureLevelEnum.unit.name,
                              )
                              .toList()[index];
                          return UnitFeatureVertical(
                            featureModel: currentFeature,
                            onTap: () {
                              final currentSelectedFeatures = [
                                ...selectedFeatures,
                              ];

                              if (!(currentSelectedFeatures
                                  .map((feature) => feature.featureName)
                                  .toList()
                                  .contains(currentFeature.featureName))) {
                                currentSelectedFeatures.add(currentFeature);

                                setState(() {
                                  selectedFeatures = currentSelectedFeatures;
                                  allFeaturesMapped.removeWhere(
                                    (feat) =>
                                        feat.featureName ==
                                        currentFeature.featureName,
                                  );
                                });
                              }
                            },
                          );
                        },
                        childCount: allFeaturesMapped
                            .sortByAndReturnSorted(
                              (feature) => feature.featureName,
                            )
                            .where(
                              (feature) =>
                                  feature.featureGroup ==
                                      UnitFeatureGroupsEnum.insideUnit.name &&
                                  feature.featureLevel ==
                                      UnitFeatureLevelEnum.unit.name,
                            )
                            .toList()
                            .length,
                      ),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 80,
                        mainAxisExtent: 100,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: CustomFilledButton(
                text: "Save",
                onTap: () {
                  widget.onSave(selectedFeatures);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> showAmenitiesBottomsheet(
  BuildContext context, {
  required List<UnitFeatureModel>? alreadySelectedFeatures,
  required Function(List<UnitFeatureModel>) onFeaturesSelected,
}) async => await showModalBottomSheet(
  context: context,
  showDragHandle: true,
  builder: (context) => AmenitiesBottomsheet(
    alreadySelectedFeatures: alreadySelectedFeatures,
    onSave: (selectedFeatures) {
      Navigator.pop(context);
      onFeaturesSelected(selectedFeatures);
    },
  ),
);
