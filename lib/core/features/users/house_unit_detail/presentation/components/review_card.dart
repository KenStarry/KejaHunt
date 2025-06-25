import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/domain/models/units/unit_review_model.dart';
import 'package:keja_hunt/core/presentation/components/avatar.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class ReviewCard extends StatefulWidget {
  final UnitReviewModel? reviewModel;

  const ReviewCard({super.key, required this.reviewModel});

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Avatar(
                      imageUrl:
                          widget.reviewModel?.userWhoReviewed?.avatarUrl ?? '',
                      size: Size(48, 48),
                    ),

                    Text(
                      widget.reviewModel?.userWhoReviewed?.username ??
                          'Unknown User',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 12,
                children: [
                  Container(
                    width: 60,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3,
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //  Ratings
                        SvgPicture.asset(
                          "assets/images/icons/rate.svg",
                          width: 12,
                          height: 12,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                        ),

                        Text(
                          widget.reviewModel?.rating.toString() ?? 'null',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
                  ),

                  SvgPicture.asset(
                    "assets/images/icons/more_circle_outlined.svg",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ],
          ),

          Text(
            widget.reviewModel?.reviewMessage ?? 'No message',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 24,
            children: [
              /// Likes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  //  Ratings
                  SvgPicture.asset(
                    "assets/images/icons/heart.svg",
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),

                  Text(
                    "938",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              Text(
                widget.reviewModel == null
                    ? ''
                    : DateTime.parse(widget.reviewModel!.updatedAt).timeAgo(),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: grey700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
