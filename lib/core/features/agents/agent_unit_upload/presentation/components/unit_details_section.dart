import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keja_hunt/core/data/repository/unit_repository.dart';
import 'package:keja_hunt/core/di/locator.dart';
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
                      "Apartment Details",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(
                child: CustomDropdownButton<String>(
                  hint: "Choose Apartment Name",
                  items: ["Apartment 1", "Apartment 2"],
                  onChanged: (apartment) {

                  },
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
                      "Pricing Details",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(
                child: Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: pricingController,
                        hintText: "Enter Rent per month",
                      ),
                    ),

                    Text("/"),

                    Container(
                      width: 30,
                      height: 30,
                      color: redColor,
                    )
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
