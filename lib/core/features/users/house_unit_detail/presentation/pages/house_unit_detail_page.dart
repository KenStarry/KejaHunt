import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_detail_carousel.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class HouseUnitDetailPage extends StatefulWidget {

  final HouseUnitModel houseUnitModel;

  const HouseUnitDetailPage({super.key, required this.houseUnitModel});

  @override
  State<HouseUnitDetailPage> createState() => _HouseUnitDetailPageState();
}

class _HouseUnitDetailPageState extends State<HouseUnitDetailPage> {

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
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  UnitDetailCarousel(imageUrls: widget.houseUnitModel.images)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
