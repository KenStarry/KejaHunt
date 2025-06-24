import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class UnitFeatureVertical extends StatefulWidget {
  final UnitFeatureModel featureModel;
  final VoidCallback? onTap;

  const UnitFeatureVertical({super.key, required this.featureModel, this.onTap});

  @override
  State<UnitFeatureVertical> createState() => _UnitFeatureVerticalState();
}

class _UnitFeatureVerticalState extends State<UnitFeatureVertical> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 8,
          children: [
            Container(
              width: 55,
              height: 55,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor100,
              ),
              child: SvgPicture.asset(widget.featureModel.featureIconPath,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),),
            ),

            Text(
              widget.featureModel.featureName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme
                  .of(
                context,
              )
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
