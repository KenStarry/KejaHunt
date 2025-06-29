import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_detail_agent_card.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_detail_carousel.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_detail_gallery.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_detail_header.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_detail_location.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_detail_overview.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_detail_reviews.dart';
import 'package:keja_hunt/core/presentation/components/custom_divider.dart';
import 'package:keja_hunt/core/presentation/components/custom_filled_button.dart';
import 'package:keja_hunt/core/utils/constants/constants.dart';
import 'package:keja_hunt/core/utils/extensions/currency_extensions.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class HouseUnitDetailPage extends StatefulWidget {
  final HouseUnitModel houseUnitModel;

  const HouseUnitDetailPage({super.key, required this.houseUnitModel});

  @override
  State<HouseUnitDetailPage> createState() => _HouseUnitDetailPageState();
}

class _HouseUnitDetailPageState extends State<HouseUnitDetailPage> {
  final ScrollController _scrollController = ScrollController();
  Color _appbarBackgroundColor = Colors.transparent;

  bool isScrolled = false;

  Timer? _scrollTimerDebounced;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {

      _scrollTimerDebounced?.cancel();

      _scrollTimerDebounced = Timer(Duration(milliseconds: 50), () {
        double scrollOffset = _scrollController.offset;

        final bool scrolled = scrollOffset > 100;
        final Color newColor = scrolled
            ? Theme.of(context).scaffoldBackgroundColor
            : Colors.transparent;

        if (scrolled != isScrolled || newColor != _appbarBackgroundColor) {
          setState(() {
            isScrolled = scrolled;
            _appbarBackgroundColor = newColor;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollTimerDebounced?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_rounded),
          ),
          title: Row(
            children: [
              Expanded(
                child: isScrolled
                    ? Text(
                        "Details Page",
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    : SizedBox.shrink(),
              ),
              UnconstrainedBox(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: isScrolled ? Colors.transparent : grey10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/images/icons/heart.svg",
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            grey800,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/images/icons/send_outlined.svg",
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            grey800,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: _appbarBackgroundColor,
          surfaceTintColor: _appbarBackgroundColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: isScrolled
                ? Brightness.dark
                : Brightness.light,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          actions: [],
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                slivers: [
                  UnitDetailCarousel(
                    imageUrls: widget.houseUnitModel.images
                        .map((image) => image.imageUrl)
                        .toList(),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 16)),

                  UnitDetailHeader(houseUnitModel: widget.houseUnitModel),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),

                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    sliver: SliverToBoxAdapter(child: CustomDivider()),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 16)),

                  UnitDetailAgentCard(
                    userModel: widget.houseUnitModel.agentUserModel,
                    agentModel: widget.houseUnitModel.agent,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 24)),

                  UnitDetailOverview(houseUnitModel: widget.houseUnitModel),
                  SliverToBoxAdapter(child: SizedBox(height: 24)),

                  UnitDetailGallery(images: widget.houseUnitModel.images),
                  SliverToBoxAdapter(child: SizedBox(height: 24)),

                  UnitDetailLocation(houseUnitModel: widget.houseUnitModel),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),

                  UnitDetailReviews(
                    averageRating: widget.houseUnitModel.averageRating,
                    reviews: widget.houseUnitModel.reviews,
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: 1000)),
                ],
              ),

              /// Book Now CTA
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: grey300.withValues(alpha: 0.5),
                        offset: Offset(0, -8),
                        blurRadius: 15,
                      ),
                    ],
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Row(
                    spacing: 24,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            "Price",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.houseUnitModel.price
                                      .shortMoneyFormat(
                                        context,
                                        currency: "Ksh",
                                      ),
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 26,
                                      ),
                                ),
                                TextSpan(
                                  text:
                                      " / ${widget.houseUnitModel.priceFrequency}",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall?.copyWith(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: CustomFilledButton(
                          text: "Book Now",
                          onTap: () {},
                        ),
                      ),
                    ],
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
