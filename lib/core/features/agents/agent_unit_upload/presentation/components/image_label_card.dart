import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/model/image_label_model.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class ImageLabelCard extends StatefulWidget {
  final ImageLabelModel imageLabelModel;
  final VoidCallback onTap;

  const ImageLabelCard({super.key, required this.imageLabelModel, required this.onTap});

  @override
  State<ImageLabelCard> createState() => _ImageLabelCardState();
}

class _ImageLabelCardState extends State<ImageLabelCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor100,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.imageLabelModel.iconPath,
                width: 20,
                height: 20,
              ),
              Text(
                widget.imageLabelModel.label,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
