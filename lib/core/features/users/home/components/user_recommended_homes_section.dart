import 'package:flutter/material.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/features/users/home/components/house_card_vertical.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:keja_hunt/core/features/users/home/components/house_card_featured.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../domain/enum/units/unit_type_enum.dart';
import '../../../../domain/models/unit_image_model.dart';

class UserRecommendedHomesSection extends StatefulWidget {
  const UserRecommendedHomesSection({super.key});

  @override
  State<UserRecommendedHomesSection> createState() =>
      _UserRecommendedHomesSectionState();
}

class _UserRecommendedHomesSectionState
    extends State<UserRecommendedHomesSection> {
  late final List<HouseUnitModel> _houseUnits;

  @override
  void initState() {
    super.initState();

    _houseUnits = [
      HouseUnitModel(
        apartmentId: '1',
        unitType: UnitTypeEnum.oneBr.name,
        price: 32000,
        images: [
          UnitImageModel(
            imageUrl:
            "https://plus.unsplash.com/premium_photo-1661950439212-558fa5cc82e0?q=80&w=1151&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            imageTag: "Kitchen",
          ),
          UnitImageModel(
            imageUrl:
            "https://plus.unsplash.com/premium_photo-1661963239507-7bdf41a5e66b?q=80&w=823&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            imageTag: "Kitchen",
          ),
        ],
      ),
      HouseUnitModel(
        apartmentId: '1',
        unitType: UnitTypeEnum.oneBr.name,
        price: 32000,
        images: [
          UnitImageModel(
            imageUrl:
            "https://www.themoonapartments.com/wp-content/uploads/2024/06/Furnished-Apartment-Building-The-Moon-Serenity-Furnished-Apartments-Lymack-Suites-Fourways-Junction-Estate-Northern-Bypass-Road.webp",
            imageTag: "Bathroom",
          ),
          UnitImageModel(
            imageUrl:
            "https://a0.muscache.com/im/pictures/6efe0428-dbe3-4d18-955b-b327e56eafc2.jpg",
            imageTag: "Sitting Room",
          ),
        ],
      ),
      HouseUnitModel(
        apartmentId: '1',
        unitType: UnitTypeEnum.oneBr.name,
        price: 32000,
        images: [
          UnitImageModel(
            imageUrl:
            "https://plus.unsplash.com/premium_photo-1661915661139-5b6a4e4a6fcc?q=80&w=1567&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            imageTag: "Bathroom",
          ),
          UnitImageModel(
            imageUrl:
            "https://plus.unsplash.com/premium_photo-1682377521625-c656fc1ff3e1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            imageTag: "Sitting Room",
          ),
        ],
      ),
      HouseUnitModel(
        apartmentId: '1',
        unitType: UnitTypeEnum.oneBr.name,
        price: 32000,
        images: [
          UnitImageModel(
            imageUrl:
            "https://plus.unsplash.com/premium_photo-1661883964999-c1bcb57a7357?q=80&w=1128&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            imageTag: "Bathroom",
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Our Recommendation",
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextButton(
                    onPressed: () {},
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

          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  HouseCardVertical(houseUnitModel: _houseUnits[index]),
              childCount: _houseUnits.length
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisExtent: 280,
              mainAxisSpacing: 16
            ),
          ),
        ],
      ),
    );
  }
}
