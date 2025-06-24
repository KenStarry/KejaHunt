
import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_price_frequency_enum.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_type_enum.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/model/upload_unit_details_result_model.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_feature_vertical.dart';
import 'package:keja_hunt/core/presentation/components/bottomsheets/amenities_bottomsheet.dart';
import 'package:keja_hunt/core/presentation/components/custom_dropdown_button.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../presentation/components/custom_filled_button.dart';
import '../../../../../utils/constants/field_formatters.dart';

class UnitDetailsSection extends StatefulWidget {
  final Function(UploadUnitDetailsResultModel) onNext;

  const UnitDetailsSection({super.key, required this.onNext});

  @override
  State<UnitDetailsSection> createState() => _UnitDetailsSectionState();
}

class _UnitDetailsSectionState extends State<UnitDetailsSection>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController pricingController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  Map<String, dynamic> unitDetailsDropdownValues = {
    "unit_type": null,
    "apartment": null,
    "price_frequency": null,
  };

  List<UnitFeatureModel>? selectedFeatures;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              /// Unit Title, Image & Description
              MultiSliver(
                children: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Unit Type",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 16)),

                  SliverToBoxAdapter(
                    child: CustomDropdownButton<UnitTypeEnum>(
                      hint: "Select type of unit",
                      value: unitDetailsDropdownValues['unit_type'],
                      items: UnitTypeEnum.values.toList(),
                      dropdownMenuItems: UnitTypeEnum.values
                          // .map((value) => value)
                          .map((item) {
                            return DropdownMenuItem<UnitTypeEnum>(
                              value: item,
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      unitTypeToReadableString(unitType: item),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                          .toList(),
                      onChanged: (unitType) {
                        setState(() {
                          unitDetailsDropdownValues['unit_type'] = unitType;
                        });
                      },
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 16)),

                  SliverToBoxAdapter(
                    child: CustomTextField(
                      controller: descriptionController,
                      inputType: TextInputType.multiline,
                      hintText: "Short description of this unit",
                      minLines: 5,
                      maxLines: 15,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24)),

              /// Apartment Details
              MultiSliver(
                children: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Apartment",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 16)),

                  SliverToBoxAdapter(
                    child: CustomDropdownButton<String>(
                      hint: "Choose Apartment Name",
                      value: unitDetailsDropdownValues['apartment'],
                      items: ["Apartment 1", "Apartment 2"],
                      onChanged: (apartment) {
                        setState(() {
                          unitDetailsDropdownValues['apartment'] = apartment;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24)),

              /// Pricing Details
              MultiSliver(
                children: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pricing",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 16)),

                  SliverToBoxAdapter(
                    child: Row(
                      spacing: 16,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomTextField(
                            controller: pricingController,
                            inputType: TextInputType.number,
                            hintText: "Rent amount",
                            fieldFormatters: [moneyTextInputFormatter],
                          ),
                        ),

                        Text(
                          "/",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: grey500,
                              ),
                        ),

                        Expanded(
                          child: CustomDropdownButton<String>(
                            hint: "Month",
                            value: unitDetailsDropdownValues['price_frequency'],
                            items: UnitPriceFrequencyEnum.values
                                .map((value) => value.name)
                                .toList(),
                            onChanged: (frequency) {
                              setState(() {
                                unitDetailsDropdownValues['price_frequency'] =
                                    frequency;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24)),

              /// Amenities
              MultiSliver(
                children: [
                  SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Unit Amenities",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),

                        TextButton(
                          onPressed: () async {
                            await showAmenitiesBottomsheet(
                              context,
                              alreadySelectedFeatures: selectedFeatures,
                              onFeaturesSelected: (features) {
                                setState(() {
                                  selectedFeatures = features;
                                });
                              },
                            );
                          },
                          child: Text("Add New"),
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  selectedFeatures == null ||
                          (selectedFeatures != null &&
                              selectedFeatures!.isEmpty)
                      ? SliverToBoxAdapter(child: SizedBox.shrink())
                      : SliverToBoxAdapter(
                          child: SizedBox(
                            width: double.infinity,
                            height: 80,
                            child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  UnitFeatureVertical(
                                    featureModel: selectedFeatures!
                                        .sortByAndReturnSorted(
                                          (feat) => feat.featureName,
                                        )[index],
                                  ),
                              itemCount: selectedFeatures!
                                  .sortByAndReturnSorted(
                                    (feat) => feat.featureName,
                                  )
                                  .length,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      SizedBox(width: 16),
                            ),
                          ),
                        ),
                ],
              ),

              SliverToBoxAdapter(child: SizedBox(height: 250)),
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
            child: CustomFilledButton(
              text: "Next",
              onTap: () {
                widget.onNext(
                  UploadUnitDetailsResultModel(
                    unitType: (unitDetailsDropdownValues['unit_type'] as UnitTypeEnum?),
                    unitDescription: descriptionController.text,
                    apartmentId: unitDetailsDropdownValues['apartment'],
                    rentAmount:
                    int.tryParse(
                      toNumericString(
                        pricingController.text,
                        allowPeriod: false,
                      ),
                    ) ??
                        0,
                    priceFrequency: unitDetailsDropdownValues['price_frequency'],
                    selectedFeatures: selectedFeatures,
                  ),
                );
              }
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
