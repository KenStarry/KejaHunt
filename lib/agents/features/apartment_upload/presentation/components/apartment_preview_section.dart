
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/agents/features/apartment_upload/presentation/model/apartment_upload_details_model.dart';

import '../../../../../core/features/agents/agent_unit_upload/presentation/bloc/upload_unit_bloc.dart';
import '../../../../../core/presentation/components/custom_filled_button.dart';

class ApartmentPreviewSection extends StatefulWidget {

  final ApartmentUploadDetailsModel? apartmentUploadDetailsModel;
  final VoidCallback onSave;

  const ApartmentPreviewSection(
      {super.key, required this.apartmentUploadDetailsModel, required this.onSave});

  @override
  State<ApartmentPreviewSection> createState() => _ApartmentPreviewSectionState();
}

class _ApartmentPreviewSectionState extends State<ApartmentPreviewSection>
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
