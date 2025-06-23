import 'package:flutter/material.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/utils/constants/constants.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

class UnitDetailGallery extends StatefulWidget {
  final List<String> imageUrls;

  const UnitDetailGallery({super.key, required this.imageUrls});

  @override
  State<UnitDetailGallery> createState() => _UnitDetailGalleryState();
}

class _UnitDetailGalleryState extends State<UnitDetailGallery> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: horizontalPadding),
      sliver: MultiSliver(
        children: [
          /// Title
          SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Gallery", style: Theme.of(context).textTheme.titleSmall),

                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
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

          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 120,
              margin: const EdgeInsets.only(right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 12,
                children: List.generate(
                  3,
                  (index) => Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: index == 2 ? Stack(
                        children: [
                          ClipRRect(
                            child: CustomNetworkImage(
                              url: widget.imageUrls[index],
                              borderRadius: BorderRadius.circular(20),
                              size: Size(double.infinity, double.infinity),
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: blackColor.withValues(alpha: 0.5),
                            ),
                            child: Center(
                              child: Text("${widget.imageUrls.length}+", style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: whiteColor
                              )),
                            ),
                          )
                        ],
                      ) : ClipRRect(
                        child: CustomNetworkImage(
                          url: widget.imageUrls[index],
                          borderRadius: BorderRadius.circular(20),
                          size: Size(double.infinity, double.infinity),
                        ),
                      ),
                    ),
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
