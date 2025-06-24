import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keja_hunt/core/data/repository/unit_repository.dart';
import 'package:keja_hunt/core/di/locator.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_feature_groups_enum.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_feature_level_enum.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_price_frequency_enum.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_type_enum.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/components/image_label_card.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/model/image_label_model.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/model/upload_unit_details_result_model.dart';
import 'package:keja_hunt/core/features/users/house_unit_detail/presentation/components/unit_feature_vertical.dart';
import 'package:keja_hunt/core/presentation/components/bottomsheets/amenities_bottomsheet.dart';
import 'package:keja_hunt/core/presentation/components/custom_dropdown_button.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
import 'package:keja_hunt/core/utils/constants/unit_constants.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../domain/models/unit_image_model.dart';
import '../../../../../presentation/components/custom_filled_button.dart';
import '../../../../../utils/constants/field_formatters.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [],
          ),
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
