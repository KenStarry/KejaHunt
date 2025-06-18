import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_filled_button.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:keja_hunt/core/presentation/components/fading_carousel.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class HouseCardBooked extends StatefulWidget {
  final HouseUnitModel houseUnitModel;

  const HouseCardBooked({super.key, required this.houseUnitModel});

  @override
  State<HouseCardBooked> createState() => _HouseCardBookedState();
}

class _HouseCardBookedState extends State<HouseCardBooked> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: Theme
              .of(context)
              .scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: grey300.withValues(alpha: 0.5),
              offset: Offset(0, 8),
              blurRadius: 15,
            )
          ]
      ),
      child: Column(
        spacing: 8,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Container(
          //       height: 35,
          //       padding: const EdgeInsets.symmetric(horizontal: 16),
          //       margin: const EdgeInsets.only(right: 16),
          //       decoration: BoxDecoration(
          //           color: grey300,
          //         borderRadius: BorderRadius.circular(100)
          //       ),
          //       child: Row(
          //         children: [
          //           Text("More Details", style: Theme.of(context).textTheme.bodyMedium,),
          //           SvgPicture.asset(
          //               "assets/images/icons/time_outlined.svg",
          //               width: 20,
          //               height: 20,
          //               colorFilter: ColorFilter.mode(Theme
          //                   .of(context)
          //                   .textTheme
          //                   .bodySmall!
          //                   .color!, BlendMode.srcIn)),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 12,
              children: [
                SizedBox(
                  width: 150,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: CustomNetworkImage(url: widget.houseUnitModel
                                .images[0])),
                      ),

                      //  Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: grey10,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              spacing: 4,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/icons/visibility_on.svg",
                                  width: 12,
                                  height: 12,
                                ),
                                Text(
                                  "37",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Luxury Apartments",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(
                              "1 Bdr, Westlands",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        spacing: 8,
                        children: [
                          SvgPicture.asset(
                              "assets/images/icons/time_outlined.svg",
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall!
                                  .color!, BlendMode.srcIn)),

                          Expanded(
                            child: Text(
                              "5 days rem",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Ksh 15,000",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(color: Theme
                                        .of(context)
                                        .colorScheme
                                        .primary,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: " / mo",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
