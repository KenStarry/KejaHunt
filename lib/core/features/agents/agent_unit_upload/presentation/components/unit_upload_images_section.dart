import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keja_hunt/core/data/repository/unit_repository.dart';
import 'package:keja_hunt/core/di/locator.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

class UnitUploadImagesSection extends StatefulWidget {

  final Function(List<XFile>) onImagesPicked;

  const UnitUploadImagesSection({super.key, required this.onImagesPicked});

  @override
  State<UnitUploadImagesSection> createState() =>
      _UnitUploadImagesSectionState();
}

class _UnitUploadImagesSectionState extends State<UnitUploadImagesSection> {
  List<XFile> pickedImages = [];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: MultiSliver(
        children: [
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
                        final currentImages = [...pickedImages];

                        for (XFile image in images) {
                          if (!(currentImages
                              .map((current) => current.name)
                              .toList()
                              .contains(image.name))) {
                            currentImages.add(image);
                          }
                        }

                        widget.onImagesPicked(currentImages);
                        setState(() {
                          pickedImages = currentImages;
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

          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 170,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  width: 210,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.file(
                      File(pickedImages[index].path),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                itemCount: pickedImages.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 24),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
