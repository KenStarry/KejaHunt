import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/features/users/home/components/house_card_booked.dart';
import 'package:keja_hunt/core/features/users/profile/presentation/model/setting_card_model.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../domain/models/unit_image_model.dart';

class UserProfileSettingsSection extends StatefulWidget {
  const UserProfileSettingsSection({super.key});

  @override
  State<UserProfileSettingsSection> createState() =>
      _UserProfileSettingsSectionState();
}

class _UserProfileSettingsSectionState
    extends State<UserProfileSettingsSection> {
  final List<Map<String, dynamic>> _settings = [
    {
      "settings": [
        SettingCardModel(
          label: "Keja Points",
          iconPath: "assets/images/icons/calendar_outlined.svg",
        ),
        SettingCardModel(
          label: "Payments",
          iconPath: "assets/images/icons/wallet_outlined.svg",
        ),
      ],
    },

    {
      "settings": [
        SettingCardModel(
          label: "Profile",
          iconPath: "assets/images/icons/profile_outlined.svg",
        ),
        SettingCardModel(
          label: "Notifications",
          iconPath: "assets/images/icons/notification_outlined.svg",
        ),
        SettingCardModel(
          label: "Security",
          iconPath: "assets/images/icons/security_outlined.svg",
        ),
      ],
    },

    {
      "settings": [
        SettingCardModel(
          label: "Language",
          iconPath: "assets/images/icons/language_outlined.svg",
        ),
        SettingCardModel(
          label: "Help Center",
          iconPath: "assets/images/icons/info_outlined.svg",
        ),
        SettingCardModel(
          label: "Invite Friends",
          iconPath: "assets/images/icons/community_outlined.svg",
        ),
      ],
    },
  ];

  late final List<HouseUnitModel> _bookedHouseUnits;

  @override
  void initState() {
    super.initState();

    _bookedHouseUnits = [
      HouseUnitModel(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "My Bookings",
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                SizedBox(
                  width: double.infinity,
                  height: 210,
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        HouseCardBooked(houseUnitModel: _bookedHouseUnits[index]),
                    itemCount: _bookedHouseUnits.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(), separatorBuilder: (BuildContext context, int index) => SizedBox(width: 16,),
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 8)),

          ..._settings.map(
            (setting) => SliverPadding(
              padding: const EdgeInsets.only(bottom: 24),
              sliver: DecoratedSliver(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(24),
                ),
                sliver: MultiSliver(
                  children: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final settingCard =
                              (setting['settings']
                                  as List<SettingCardModel>)[index];
                          return ListTile(
                            leading: SvgPicture.asset(
                              settingCard.iconPath,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).textTheme.bodyMedium!.color!,
                                BlendMode.srcIn,
                              ),
                            ),
                            title: Text(
                              settingCard.label,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            trailing: Container(
                              width: 24,
                              height: 24,
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                "assets/images/icons/chevron_right.svg",
                                width: double.infinity,
                                height: double.infinity,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.color!,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            onTap: () {
                              context.goNamed("login");
                            },
                          );
                        },
                        childCount:
                            (setting['settings'] as List<SettingCardModel>)
                                .length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
