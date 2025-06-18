import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:keja_hunt/core/presentation/components/fading_carousel.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class HouseCardVertical extends StatefulWidget {
  final HouseUnitModel houseUnitModel;

  const HouseCardVertical({super.key, required this.houseUnitModel});

  @override
  State<HouseCardVertical> createState() => _HouseCardVerticalState();
}

class _HouseCardVerticalState extends State<HouseCardVertical> {
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
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: grey300.withValues(alpha: 0.5),
            offset: Offset(0, 8),
            blurRadius: 15,
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 12,
        children: [
          Expanded(
            flex: 10,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: CustomNetworkImage(url: widget.houseUnitModel.images[0].imageUrl)),
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
                            "assets/images/icons/rate.svg",
                            width: 12,
                            height: 12,
                          ),
                          Text(
                            "4.6",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
          
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Luxury Apartments",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge
                            ?.copyWith(
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        "1 Bdr, Westlands",
                        style: Theme.of(context).textTheme.bodySmall
                            ?.copyWith(),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Ksh 15,000",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text: " / mo",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/images/icons/heart.svg",
                          width: 16,
                          height: 16,
                          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
