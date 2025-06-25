import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/review_card.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/utils/constants/constants.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

class UnitDetailReviews extends StatefulWidget {
  const UnitDetailReviews({super.key});

  @override
  State<UnitDetailReviews> createState() => _UnitDetailReviewsState();
}

class _UnitDetailReviewsState extends State<UnitDetailReviews> {
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
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(right: 20),
              child: ReviewCard()
            ),
          ),
        ],
      ),
    );
  }
}
