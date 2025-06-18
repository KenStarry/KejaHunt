import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class UnitFacilityHorizontal extends StatefulWidget {
  final UnitFeatureModel featureModel;

  const UnitFacilityHorizontal({super.key, required this.featureModel});

  @override
  State<UnitFacilityHorizontal> createState() => _UnitFacilityHorizontalState();
}

class _UnitFacilityHorizontalState extends State<UnitFacilityHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Container(
            width: 45,
            height: 45,
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
            (widget.featureModel.featureDescription != null &&
                    widget.featureModel.featureDescription!.isNotEmpty
                ? widget.featureModel.featureName
                : widget.featureModel.featureName),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
