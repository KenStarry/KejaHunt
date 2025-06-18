import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_detail_carousel.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_detail_header.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class HouseUnitDetailPage extends StatefulWidget {
  final HouseUnitModel houseUnitModel;

  const HouseUnitDetailPage({super.key, required this.houseUnitModel});

  @override
  State<HouseUnitDetailPage> createState() => _HouseUnitDetailPageState();
}

class _HouseUnitDetailPageState extends State<HouseUnitDetailPage> {
  final ScrollController _scrollController = ScrollController();
  Color _appbarBackgroundColor = Colors.transparent;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double scrollOffset = _scrollController.offset;

      setState(() {
        _appbarBackgroundColor = scrollOffset > 100
            ? Theme.of(context).scaffoldBackgroundColor
            : Colors.transparent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_rounded),
          ),
          title: Align(
            alignment: Alignment.centerRight,
            child: UnconstrainedBox(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: grey10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/images/icons/heart.svg",
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(grey800, BlendMode.srcIn),
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/images/icons/send_outlined.svg",
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(grey800, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: _appbarBackgroundColor,
          surfaceTintColor: _appbarBackgroundColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          actions: [

          ],
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                slivers: [
                  UnitDetailCarousel(imageUrls: widget.houseUnitModel.images),

                  SliverToBoxAdapter(child: SizedBox(height: 16)),

                  UnitDetailHeader(houseUnitModel: widget.houseUnitModel)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
