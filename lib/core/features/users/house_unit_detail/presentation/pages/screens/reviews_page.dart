import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/domain/models/units/unit_review_model.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/review_card.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../../utils/theme/colors.dart';
import '../bloc/reviews_bloc.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  double? averageRating({required List<UnitReviewModel> reviews}) {
    final validRatings = reviews
        .map((r) => r.rating)
        .where((r) => r != null)
        .cast<double>()
        .toList();

    if (validRatings.isEmpty) return null;

    final sum = validRatings.reduce((a, b) => a + b);
    return sum / validRatings.length;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, reviewsState) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_rounded),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${averageRating(reviews: reviewsState is ReviewsSuccess ? reviewsState.reviews : [])} (${reviewsState is ReviewsSuccess ? reviewsState.reviews.length : 0} review${(reviewsState is ReviewsSuccess ? reviewsState.reviews.length : 0) == 1 ? '' : 's'})",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Theme.of(
                context,
              ).scaffoldBackgroundColor,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            actions: [],
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 24)),
                /// Multi Slivers
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ReviewCard(
                      reviewModel: reviewsState is ReviewsSuccess
                          ? reviewsState.reviews[index]
                          : null,
                    ),
                    childCount: reviewsState is ReviewsSuccess
                        ? reviewsState.reviews.length
                        : 10,
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 200)),
              ],
            ),
          ),
        );
      },
    );
  }
}
