import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/features/users/home/components/user_recommended_homes_section.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:keja_hunt/core/features/users/home/components/user_featured_homes_section.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
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
          /// Search
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: CustomTextField(
                controller: controller,
                hintText: "Search",
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: SvgPicture.asset(
                    "assets/images/icons/search_outlined.svg",
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      grey400,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: UnconstrainedBox(
                    child: SvgPicture.asset(
                      "assets/images/icons/filter.svg",
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          UserFeaturedHomesSection(),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          UserRecommendedHomesSection()
        ],
      ),
    );
  }
}
