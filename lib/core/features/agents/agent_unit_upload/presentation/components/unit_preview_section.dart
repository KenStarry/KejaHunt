
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/model/upload_unit_details_result_model.dart';

import '../../../../../domain/models/unit_image_model.dart';
import '../../../../../presentation/components/custom_filled_button.dart';
import '../bloc/upload_unit_bloc.dart';

class UnitPreviewSection extends StatefulWidget {

  final UploadUnitDetailsResultModel? uploadUnitDetailsResultModel;
  final List<UnitImageModel> pickedUnitImages;
  final VoidCallback onSave;

  const UnitPreviewSection(
      {super.key, required this.uploadUnitDetailsResultModel, required this.pickedUnitImages, required this.onSave});

  @override
  State<UnitPreviewSection> createState() => _UnitPreviewSectionState();
}

class _UnitPreviewSectionState extends State<UnitPreviewSection>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 24,
                children: [
                  SvgPicture.asset("assets/images/undraw/coming_soon.svg",
                  width: 250,
                  height: 250,),
                  Text("Coming Soon")
                ],
              ),
            ),

          ],
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
            child: BlocBuilder<UploadUnitBloc, UploadUnitState>(
              builder: (context, uploadState) {
                return CustomFilledButton(
                  text: "Save",
                  isLoading: uploadState is UploadUnitLoading,
                  onTap: widget.onSave,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
