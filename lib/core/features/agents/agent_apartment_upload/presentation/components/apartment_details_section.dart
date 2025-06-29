import 'package:flutter/material.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_dropdown_button.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

import '../../../../../env/env.dart';
import '../../../../../presentation/components/custom_filled_button.dart';
import '../../../../../utils/theme/colors.dart';

class ApartmentDetailsSection extends StatefulWidget {
  final Function() onNext;

  const ApartmentDetailsSection({super.key, required this.onNext});

  @override
  State<ApartmentDetailsSection> createState() =>
      _ApartmentDetailsSectionState();
}

class _ApartmentDetailsSectionState extends State<ApartmentDetailsSection>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  Map<String, dynamic> unitDetailsDropdownValues = {"location": null};

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

              /// Apartment Location Picker
              MultiSliver(
                children: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Location",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 16)),

                  SliverToBoxAdapter(
                    child: GooglePlaceAutoCompleteTextField(
                      textEditingController: locationController,
                      googleAPIKey: Env.googleApiKey,
                      countries: ["ke"],
                      debounceTime: 1000,
                      boxDecoration: BoxDecoration(
                        border: null
                      ),
                      textStyle: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                      inputDecoration: InputDecoration(
                        filled: true,
                        fillColor: grey50,
                        hintText: "Select Location",
                        errorMaxLines: 2,
                        errorStyle: TextStyle(
                          fontSize: Theme.of(
                            context,
                          ).textTheme.bodySmall!.fontSize,
                          fontWeight: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.fontWeight,
                          color: redColor,
                        ),
                        hintStyle: Theme.of(context).textTheme.bodyLarge
                            ?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color!
                              .withValues(alpha: 0.6),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 18.0,
                        ),
                      ),
                      isLatLngRequired: true,
                      // if you required coordinates from place detail
                      getPlaceDetailWithLatLng: (Prediction prediction) {
                        // this method will return latlng with place detail
                        print("placeDetails LONGITUDE" + prediction.lng.toString());
                        print("placeDetails LATITUDE" + prediction.lat.toString());
                      },
                      // this callback is called when isLatLngRequired is true
                      itemClick: (Prediction prediction) {
                        locationController.text = prediction.description ?? '';
                        locationController.selection =
                            TextSelection.fromPosition(
                              TextPosition(
                                offset: prediction.description?.length ?? 0,
                              ),
                            );
                      },
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24)),

              SliverToBoxAdapter(child: SizedBox(height: 250)),
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
            child: CustomFilledButton(text: "Next", onTap: () {}),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
