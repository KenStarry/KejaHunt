import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/features/users/home/components/user_recommended_homes_section.dart';
import 'package:keja_hunt/core/features/users/profile/presentation/components/user_profile_header.dart';
import 'package:keja_hunt/core/features/users/profile/presentation/components/user_profile_settings_section.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:keja_hunt/core/features/users/home/components/user_featured_homes_section.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(top: 24),
      // padding: const EdgeInsets.only(left: 20),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          /// User Profile Header
          SliverToBoxAdapter(child: UserProfileHeader()),

          SliverToBoxAdapter(child: SizedBox(height: 24)),

          UserProfileSettingsSection()
        ],
      ),
    );
  }
}
