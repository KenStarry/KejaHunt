import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keja_hunt/core/data/repository/unit_repository.dart';
import 'package:keja_hunt/core/di/locator.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../domain/models/unit_image_model.dart';

class UnitUploadImagesSection extends StatefulWidget {
  final Function(List<UnitImageModel>) onImagesPicked;

  const UnitUploadImagesSection({super.key, required this.onImagesPicked});

  @override
  State<UnitUploadImagesSection> createState() =>
      _UnitUploadImagesSectionState();
}

class _UnitUploadImagesSectionState extends State<UnitUploadImagesSection> {
  // List<XFile> pickedImages = [];
  List<UnitImageModel> pickedUnitImages = [];

  List<String> imageLabels = ['Unlabelled'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Images", style: Theme.of(context).textTheme.titleSmall),

                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextButton(
                    onPressed: () async {
                      final unitRepo = locator.get<UnitRepository>();

                      await unitRepo.pickMultipleImages().then((images) {
                        final currentImages = [...pickedUnitImages];

                        for (XFile image in images) {
                          if (!(currentImages
                              .map((current) => current.imageFile!.name)
                              .toList()
                              .contains(image.name))) {
                            currentImages.add(
                              UnitImageModel(
                                imageFile: image,
                                imageTag: "Unlabelled",
                              ),
                            );
                          }
                        }

                        widget.onImagesPicked(currentImages);
                        setState(() {
                          pickedUnitImages = currentImages.toList();
                        });
                      });
                    },
                    child: Text(
                      "Add New",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 16)),

          /// Organize the Children based on labels
          ...pickedUnitImages
              .map((unitModel) => unitModel.imageTag)
              .toSet()
              .map(
                (label) => MultiSliver(
                  children: [
                    SliverToBoxAdapter(
                      child: Row(
                        spacing: 24,
                        children: [
                          Text(
                            label,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Expanded(
                            child: Divider(thickness: 1, color: grey300),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: grey300.withValues(alpha: 0.5),
                                  offset: Offset(0, 8),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                pickedUnitImages
                                    .where(
                                      (unitImage) =>
                                          unitImage.imageTag == label,
                                    )
                                    .length
                                    .toString(),
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 24)),
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final currentUnitImage = pickedUnitImages
                              .where((unitImage) => unitImage.imageTag == label)
                              .toList()[index];
                          return Container(
                            width: 210,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0, right: 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                child: Image.file(
                                                  File(
                                                    currentUnitImage
                                                        .imageFile!
                                                        .path,
                                                  ),
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
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
                                                    final currentImages = [
                                                      ...pickedUnitImages,
                                                    ];

                                                    currentImages.removeWhere(
                                                      (file) =>
                                                          file
                                                              .imageFile!
                                                              .name ==
                                                          currentUnitImage
                                                              .imageFile!
                                                              .name,
                                                    );

                                                    widget.onImagesPicked(
                                                      currentImages,
                                                    );
                                                    setState(() {
                                                      pickedUnitImages =
                                                          currentImages;
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
                                    UnconstrainedBox(
                                      child: TextButton(
                                        onPressed: () {
                                          /// Add this Image to Kitchen
                                          final currentImageUsingFileName =
                                              pickedUnitImages.firstWhere(
                                                (unitImage) =>
                                                    unitImage.imageFile!.name ==
                                                    currentUnitImage
                                                        .imageFile!
                                                        .name,
                                              );

                                          final actualIndex = pickedUnitImages
                                              .indexOf(
                                                currentImageUsingFileName,
                                              );

                                          setState(() {
                                            pickedUnitImages[actualIndex] =
                                                pickedUnitImages[actualIndex]
                                                    .copyWith(
                                                      imageTag: "Bedroom",
                                                    );
                                          });
                                        },
                                        child: Row(
                                          spacing: 6,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/icons/edit_alt_outlined.svg",
                                              width: 16,
                                              height: 16,
                                              colorFilter: ColorFilter.mode(
                                                Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            Text(
                                              label == 'Unlabelled' ? "Add Label" : label,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.primary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: pickedUnitImages
                            .where((unitImage) => unitImage.imageTag == label)
                            .length,
                      ),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 170,
                        mainAxisExtent: 200,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: 1,
                      ),
                    ),
                  ],
                ),
              ),

          SliverToBoxAdapter(child: SizedBox(height: 150)),
        ],
      ),
    );
  }
}
