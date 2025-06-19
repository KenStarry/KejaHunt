import 'package:flutter/material.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

class UnitUploadImagesSection extends StatefulWidget {
  const UnitUploadImagesSection({super.key});

  @override
  State<UnitUploadImagesSection> createState() =>
      _UnitUploadImagesSectionState();
}

class _UnitUploadImagesSectionState extends State<UnitUploadImagesSection> {
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
                  "Images",
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                // Padding(
                //   padding: const EdgeInsets.only(right: 12.0),
                //   child: TextButton(
                //     onPressed: () {},
                //     child: Text(
                //       "See All",
                //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                //         color: Theme.of(context).colorScheme.primary,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 16)),

          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 170,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  width: 210,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: CustomNetworkImage(
                    url:
                        "https://plus.unsplash.com/premium_photo-1661902863227-410df18b90e8?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 24),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
