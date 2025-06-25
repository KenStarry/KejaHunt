import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/review_card.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/utils/constants/constants.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UnitDetailReviews extends StatefulWidget {
  const UnitDetailReviews({super.key});

  @override
  State<UnitDetailReviews> createState() => _UnitDetailReviewsState();
}

class _UnitDetailReviewsState extends State<UnitDetailReviews> {

  int activeIndex = 0;

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

                Expanded(
                  child: Row(
                    spacing: 4,
                    children: [
                      //  Ratings
                      SvgPicture.asset(
                        "assets/images/icons/rate.svg",
                        width: 20,
                        height: 20,
                      ),

                      Text(
                        "4.8 (150 reviews)",
                        style:Theme.of(context).textTheme.titleSmall
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextButton(
                    onPressed: () {
                      // context.pushNamed("gallery", extra: widget.images);
                    },
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

          SliverToBoxAdapter(child: SizedBox(height: 24)),

          SliverToBoxAdapter(
            child: Column(
              spacing: 16,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: slider.CarouselSlider(
                      items: List.generate(5, (index) => ReviewCard()),
                      options: slider.CarouselOptions(
                        height: double.infinity,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
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
                  ),
                ),

                /// Dots indicator
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      effect: SwapEffect(
                        dotWidth: 8,
                        dotHeight: 8,
                        activeDotColor: Theme.of(context).colorScheme.primary,
                        dotColor: grey300,
                      ),
                      count: 5,
                    ),
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
