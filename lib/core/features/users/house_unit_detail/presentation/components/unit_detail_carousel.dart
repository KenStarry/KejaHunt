import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:flutter/material.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/theme/colors.dart';

class UnitDetailCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const UnitDetailCarousel({super.key, required this.imageUrls});

  @override
  State<UnitDetailCarousel> createState() => _UnitDetailCarouselState();
}

class _UnitDetailCarouselState extends State<UnitDetailCarousel> {
  late final slider.CarouselSliderController _controller;

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = slider.CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 3 / 3,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).colorScheme.onPrimary,
          child: Stack(
            children: [
              slider.CarouselSlider(
                items: widget.imageUrls
                    .map((url) => CustomNetworkImage(url: url))
                    .toList(),
                options: slider.CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),

              /// Dots indicator
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    effect: ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      activeDotColor: Theme.of(context).colorScheme.primary,
                      dotColor: grey300,
                    ),
                    count: widget.imageUrls.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
