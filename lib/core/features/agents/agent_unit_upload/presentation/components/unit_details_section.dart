import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keja_hunt/core/data/repository/unit_repository.dart';
import 'package:keja_hunt/core/di/locator.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_price_frequency_enum.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/components/image_label_card.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/model/image_label_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_dropdown_button.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../domain/models/unit_image_model.dart';

class UnitDetailsSection extends StatefulWidget {
  const UnitDetailsSection({super.key});

  @override
  State<UnitDetailsSection> createState() => _UnitDetailsSectionState();
}

class _UnitDetailsSectionState extends State<UnitDetailsSection> {
  final TextEditingController pricingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          /// Apartment Details
          MultiSliver(
            children: [
              SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Apartment",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 16)),

              SliverToBoxAdapter(
                child: CustomDropdownButton<String>(
                  hint: "Choose Apartment Name",
                  items: ["Apartment 1", "Apartment 2"],
                  onChanged: (apartment) {},
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24)),

          /// Pricing Details
          MultiSliver(
            children: [
              SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pricing",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 16)),

              SliverToBoxAdapter(
                child: Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        controller: pricingController,
                        inputType: TextInputType.number,
                        hintText: "Rent amount",
                      ),
                    ),

                    Text(
                      "/",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: grey500,
                      ),
                    ),

                    Expanded(
                      child: CustomDropdownButton<String>(
                        hint: "Month",
                        items: UnitPriceFrequencyEnum.values
                            .map((value) => value.name)
                            .toList(),
                        onChanged: (apartment) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SliverToBoxAdapter(child: SizedBox(height: 150)),
        ],
      ),
    );
  }
}
