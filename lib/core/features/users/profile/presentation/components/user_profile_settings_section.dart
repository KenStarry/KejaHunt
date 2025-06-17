import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/features/users/profile/presentation/model/setting_card_model.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
          label: "My Bookings",
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

                Container(
                  width: double.infinity,
                  height: 200,
                  color: redColor,
                )
              ],
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 24)),

          ..._settings
              .map(
                (setting) => SliverPadding(
              padding: const EdgeInsets.only(bottom: 24),
              sliver: DecoratedSliver(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(24)
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
                                  Theme.of(context).textTheme.bodyMedium!.color!,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          );
                        },
                        childCount:
                        (setting['settings'] as List<SettingCardModel>).length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
