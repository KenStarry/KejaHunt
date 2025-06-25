
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../../utils/theme/colors.dart';

class GalleryPage extends StatefulWidget {
  final List<UnitImageModel> unitImages;

  const GalleryPage({super.key, required this.unitImages});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Gallery", style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        actions: [],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            /// Multi Slivers
            ...widget.unitImages
                .map((unitModel) => unitModel.imageTag)
                .toSet()
                .map(
                  (label) => SliverPadding(
                    padding: const EdgeInsets.only(left: 20),
                    sliver: MultiSliver(
                      children: [
                        SliverToBoxAdapter(child: SizedBox(height: 24)),
                        SliverToBoxAdapter(
                          child: Row(
                            spacing: 24,
                            children: [
                              Text(
                                label,
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              Expanded(
                                child: Divider(thickness: 1, color: grey300),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(
                                    context,
                                  ).scaffoldBackgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: grey300.withValues(alpha: 0.5),
                                      offset: Offset(0, 8),
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    widget.unitImages
                                        .where(
                                          (unitImage) =>
                                              unitImage.imageTag == label,
                                        )
                                        .length
                                        .toString(),
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 20)),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            width: double.infinity,
                            height: 120,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final currentUnitImage = widget.unitImages
                                    .where(
                                      (unitImage) =>
                                          unitImage.imageTag == label,
                                    )
                                    .toList()[index];
                                return Container(
                                  width: 120,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    child: CustomNetworkImage(
                                      url: currentUnitImage.imageUrl,
                                      borderRadius:
                                          BorderRadius.circular(20),
                                    ),
                                  ),
                                );
                              },
                              itemCount: widget.unitImages
                                  .where(
                                    (unitImage) => unitImage.imageTag == label,
                                  )
                                  .length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      SizedBox(width: 12),
                            ),
                          ),
                        ),
                        // SliverToBoxAdapter(child: SizedBox(height: 24)),
                        // SliverGrid(
                        //   delegate: SliverChildBuilderDelegate(
                        //     (context, index) {
                        //       final currentUnitImage = widget.unitImages
                        //           .where(
                        //             (unitImage) => unitImage.imageTag == label,
                        //           )
                        //           .toList()[index];
                        //       return Container(
                        //         width: 210,
                        //         height: double.infinity,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(24),
                        //           color: Theme.of(
                        //             context,
                        //           ).scaffoldBackgroundColor,
                        //         ),
                        //         child: AspectRatio(
                        //           aspectRatio: 1 / 1,
                        //           child: Stack(
                        //             children: [
                        //               Padding(
                        //                 padding: const EdgeInsets.only(
                        //                   top: 8.0,
                        //                   right: 8,
                        //                 ),
                        //                 child: ClipRRect(
                        //                   borderRadius: BorderRadius.circular(24),
                        //                   child: CustomNetworkImage(
                        //                     url: currentUnitImage.imageUrl,
                        //                     borderRadius: BorderRadius.circular(
                        //                       24,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //     childCount: widget.unitImages
                        //         .where((unitImage) => unitImage.imageTag == label)
                        //         .length,
                        //   ),
                        //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        //     maxCrossAxisExtent: 170,
                        //     mainAxisExtent: 200,
                        //     crossAxisSpacing: 16,
                        //     mainAxisSpacing: 16,
                        //     childAspectRatio: 1,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),

            SliverToBoxAdapter(child: SizedBox(height: 200)),
          ],
        ),
      ),
    );
  }
}
