import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:keja_hunt/agents/features/apartment_upload/presentation/model/apartment_upload_details_model.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_dropdown_button.dart';
import 'package:keja_hunt/core/presentation/components/custom_snackbar.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

import '../../../../../core/data/repository/unit_repository.dart';
import '../../../../../core/di/locator.dart';
import '../../../../../core/env/env.dart';
import '../../../../../core/presentation/components/custom_filled_button.dart';
import '../../../../../core/utils/theme/colors.dart';

class ApartmentDetailsSection extends StatefulWidget {
  final Function(ApartmentUploadDetailsModel) onNext;

  const ApartmentDetailsSection({super.key, required this.onNext});

  @override
  State<ApartmentDetailsSection> createState() =>
      _ApartmentDetailsSectionState();
}

class _ApartmentDetailsSectionState extends State<ApartmentDetailsSection>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  XFile? pickedCoverImage;

  double? lat;
  double? lng;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              /// Cover Image Section
              SliverToBoxAdapter(
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: GestureDetector(
                    onTap: () async {
                      /// Pick Image from Gallery
                      final unitRepo = locator.get<UnitRepository>();

                      await unitRepo.pickSingleImage().then((image) {
                        setState(() {
                          pickedCoverImage = image;
                        });
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: grey50,
                      ),
                      child: pickedCoverImage == null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 24,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/icons/image-edit.svg",
                                  width: 100,
                                  height: 100,
                                  colorFilter: ColorFilter.mode(
                                    grey500,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Cover Image",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleSmall,
                                    ),
                                    Text(
                                      "Pick a cover image for this apartment",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(32),
                                  child: Image.file(
                                    File(pickedCoverImage!.path),
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Center(
                                  child: SvgPicture.asset(
                                    "assets/images/icons/image-edit.svg",
                                    width: 100,
                                    height: 100,
                                    colorFilter: ColorFilter.mode(
                                      grey100.withValues(alpha: 0.5),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(
                                        context,
                                      ).scaffoldBackgroundColor,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          pickedCoverImage = null;
                                        });
                                      },
                                      padding: EdgeInsets.zero,
                                      icon: SvgPicture.asset(
                                        "assets/images/icons/close_outlined.svg",
                                        width: 28,
                                        height: 28,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
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
                    child: CustomTextField(
                      controller: nameController,
                      inputType: TextInputType.multiline,
                      hintText: "Joyous, Luxury Apartments etc.",
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),

                  SliverToBoxAdapter(
                    child: CustomTextField(
                      controller: descriptionController,
                      inputType: TextInputType.multiline,
                      hintText: "Short description of this apartment",
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
                      boxDecoration: BoxDecoration(border: null),
                      textStyle: Theme.of(context).textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600),
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
                      getPlaceDetailWithLatLng: (Prediction prediction) {
                        // this method will return latlng with place detail
                        setState(() {
                          lat = prediction.lat == null
                              ? null
                              : double.parse(prediction.lat!);
                          lng = prediction.lng == null
                              ? null
                              : double.parse(prediction.lng!);
                        });
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
                if (pickedCoverImage == null) {
                  showCustomSnackbar(context, "Please upload cover image");
                } else {
                  widget.onNext(
                    ApartmentUploadDetailsModel(
                      name: nameController.text,
                      description: descriptionController.text,
                      location: locationController.text,
                      lat: lat,
                      lng: lng,
                      coverImage: pickedCoverImage!,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
