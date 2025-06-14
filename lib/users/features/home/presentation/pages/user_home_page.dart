import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

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
      padding: const EdgeInsets.only(left: 20),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          /// Search
          SliverPadding(
            padding: const EdgeInsets.only(right: 20),
            sliver: SliverToBoxAdapter(
              child: CustomTextField(
                controller: controller,
                hintText: "Search",
                prefix: SvgPicture.asset(
                  "assets/images/icons/search_outlined.svg",
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    grey400,
                    BlendMode.srcIn,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/images/icons/filter.svg",
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Text(
                  "Discover\nyour new home!",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 26),
                ),
                Text(
                  "Start hunting for that dream home today",
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 80,
              margin: const EdgeInsets.only(top: 24),
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black.withValues(alpha: 0.1),
                          //     blurRadius: 4,
                          //     offset: const Offset(0, 2),
                          //   ),
                          // ],
                        ),
                        child: UnconstrainedBox(
                          child: SvgPicture.asset(
                            'assets/images/icons/house.svg',
                            width: 26,
                            height: 26,
                            colorFilter: ColorFilter.mode(
                              whiteColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),

                      Text(
                        "1 Bdr",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ),

          /// Featured Categories section
        ],
      ),
    );
  }
}
