import 'package:flutter/material.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;

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
                color: Colors.red,
                borderRadius: BorderRadius.circular(32),
              ),
              child: slider.CarouselSlider(
                carouselController: _carouselController,
                items: widget.houseUnitModel.images
                    .map(
                      (url) => ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: CustomNetworkImage(url: url),
                      ),
                    )
                    .toList(),
                options: slider.CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 6),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
