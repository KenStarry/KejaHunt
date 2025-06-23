import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_feature_horizontal.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

class UnitDetailHeader extends StatefulWidget {
  final HouseUnitModel houseUnitModel;

  const UnitDetailHeader({super.key, required this.houseUnitModel});

  @override
  State<UnitDetailHeader> createState() => _UnitDetailHeaderState();
}

class _UnitDetailHeaderState extends State<UnitDetailHeader> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 16,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      "1 Bedroom",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    Row(
                      spacing: 12,
                      children: [
                        //  Ratings
                        SvgPicture.asset(
                          "assets/images/icons/location_outlined.svg",
                          width: 16,
                          height: 16,
                          colorFilter: ColorFilter.mode(grey700, BlendMode.srcIn),
                        ),

                        Text(
                          "Dagoretti, Uthiiru",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700,
                          color: grey700),
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 12,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.08),
                      ),
                      child: Text(
                        "Luxury Homes",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    Row(
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
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),

                /// Core Features
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ListView.separated(
                    itemBuilder: (context, index) => UnitFeatureHorizontal(
                      featureModel: widget.houseUnitModel.features[index],
                    ),
                    itemCount: widget.houseUnitModel.features.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 24),
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
