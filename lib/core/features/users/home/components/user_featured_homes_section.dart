import 'package:flutter/material.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:keja_hunt/core/features/users/home/components/house_card_featured.dart';
import 'package:sliver_tools/sliver_tools.dart';

class UserFeaturedHomesSection extends StatefulWidget {
  const UserFeaturedHomesSection({super.key});

  @override
  State<UserFeaturedHomesSection> createState() =>
      _UserFeaturedHomesSectionState();
}

class _UserFeaturedHomesSectionState extends State<UserFeaturedHomesSection> {

  late final List<HouseUnitModel> _houseUnits;

  @override
  void initState() {
    super.initState();

    _houseUnits = [
      HouseUnitModel(
          images: [
            "https://plus.unsplash.com/premium_photo-1661950439212-558fa5cc82e0?q=80&w=1151&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "https://plus.unsplash.com/premium_photo-1661963239507-7bdf41a5e66b?q=80&w=823&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          ]
      ),
      HouseUnitModel(
          images: [
            "https://www.themoonapartments.com/wp-content/uploads/2024/06/Furnished-Apartment-Building-The-Moon-Serenity-Furnished-Apartments-Lymack-Suites-Fourways-Junction-Estate-Northern-Bypass-Road.webp",
            "https://a0.muscache.com/im/pictures/6efe0428-dbe3-4d18-955b-b327e56eafc2.jpg"
          ]
      ),
      HouseUnitModel(
        images: [
          "https://plus.unsplash.com/premium_photo-1661915661139-5b6a4e4a6fcc?q=80&w=1567&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://plus.unsplash.com/premium_photo-1682377521625-c656fc1ff3e1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        ]
      ),
      HouseUnitModel(
        images: [
          "https://plus.unsplash.com/premium_photo-1661883964999-c1bcb57a7357?q=80&w=1128&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        ]
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 20),
      sliver: MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured",
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextButton(onPressed: (){}, child: Text("See All", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold
                  ))),
                )
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 400,
              child: ListView.builder(itemBuilder: (context, index) => HouseCardFeatured(houseUnitModel: _houseUnits[index]),
              itemCount: _houseUnits.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics()),
            ),
          )
        ],
      ),
    );
  }
}
