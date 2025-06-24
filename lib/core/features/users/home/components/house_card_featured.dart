import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_type_enum.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:keja_hunt/core/presentation/components/fading_carousel.dart';
import 'package:keja_hunt/core/utils/extensions/currency_extensions.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class HouseCardFeatured extends StatefulWidget {
  final HouseUnitModel houseUnitModel;

  const HouseCardFeatured({super.key, required this.houseUnitModel});

  @override
  State<HouseCardFeatured> createState() => _HouseCardFeaturedState();
}

class _HouseCardFeaturedState extends State<HouseCardFeatured> {
  late final slider.CarouselSliderController _carouselController;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();

    _carouselController = slider.CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: double.infinity,
      margin: const EdgeInsets.only(right: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          IgnorePointer(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: FadingCarousel(
                  imageUrls: widget.houseUnitModel.images
                      .map((image) => image.imageUrl)
                      .toList(),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 28,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: grey10,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        spacing: 4,
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/rate.svg",
                            width: 16,
                            height: 16,
                          ),
                          Text(
                            "4.6",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.3),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.houseUnitModel.title,
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(color: whiteColor),
                                ),
                                Text(
                                  "${unitTypeToReadableString(unitType: UnitTypeEnum.values.firstWhere((value) => value.name == widget.houseUnitModel.unitType))}, Westlands",
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(color: whiteColor),
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: widget.houseUnitModel.price.shortMoneyFormat(context, currency: "Ksh"),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(color: whiteColor),
                                            ),
                                            TextSpan(
                                              text: "/${widget.houseUnitModel.priceFrequency}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(color: whiteColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        "assets/images/icons/heart.svg",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ),
                        ),
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 24.0,
                      //     vertical: 20,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.only(
                      //       bottomLeft: Radius.circular(32),
                      //       bottomRight: Radius.circular(32),
                      //     ),
                      //     gradient: LinearGradient(
                      //       begin: Alignment.topCenter,
                      //       end: Alignment.bottomCenter,
                      //       colors: [
                      //         blackColor.withValues(alpha: 0.1),
                      //         blackColor.withValues(alpha: 0.6),
                      //         blackColor.withValues(alpha: 0.9),
                      //       ],
                      //     ),
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         widget.houseUnitModel.title,
                      //         style: Theme.of(context).textTheme.titleSmall
                      //             ?.copyWith(color: whiteColor),
                      //       ),
                      //       Text(
                      //         "${unitTypeToReadableString(unitType: UnitTypeEnum.values.firstWhere((value) => value.name == widget.houseUnitModel.unitType))}, Westlands",
                      //         style: Theme.of(context).textTheme.bodyLarge
                      //             ?.copyWith(color: whiteColor),
                      //       ),
                      //
                      //       Row(
                      //         children: [
                      //           Expanded(
                      //             child: Text.rich(
                      //               TextSpan(
                      //                 children: [
                      //                   TextSpan(
                      //                     text: widget.houseUnitModel.price.shortMoneyFormat(context, currency: "Ksh"),
                      //                     style: Theme.of(context)
                      //                         .textTheme
                      //                         .titleSmall
                      //                         ?.copyWith(color: whiteColor),
                      //                   ),
                      //                   TextSpan(
                      //                     text: "/month",
                      //                     style: Theme.of(context)
                      //                         .textTheme
                      //                         .bodyMedium
                      //                         ?.copyWith(color: whiteColor),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //           IconButton(
                      //             onPressed: () {},
                      //             icon: SvgPicture.asset(
                      //               "assets/images/icons/heart.svg",
                      //               width: 24,
                      //               height: 24,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
