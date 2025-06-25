import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/domain/models/units/unit_review_model.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/review_card.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../../utils/theme/colors.dart';

class ReviewsPage extends StatefulWidget {
  final List<UnitReviewModel> unitReviews;

  const ReviewsPage({super.key, required this.unitReviews});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
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
            Text("4.8 (1,275 reviews)", style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        actions: [],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            /// Multi Slivers
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ReviewCard(reviewModel: widget.unitReviews[index]),
                childCount: widget.unitReviews.length,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 200)),
          ],
        ),
      ),
    );
  }
}
