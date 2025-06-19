import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/components/unit_upload_images_section.dart';
import 'package:keja_hunt/core/presentation/components/custom_filled_button.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class AgentUnitUploadPage extends StatefulWidget {
  const AgentUnitUploadPage({super.key});

  @override
  State<AgentUnitUploadPage> createState() => _AgentUnitUploadPageState();
}

class _AgentUnitUploadPageState extends State<AgentUnitUploadPage> {
  late final TextEditingController _apartmentNameController;

  @override
  void initState() {
    super.initState();

    _apartmentNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                  leading: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/images/icons/arrow_back.svg",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  title: Text(
                    "Upload Unit",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: UnconstrainedBox(
                        child: SvgPicture.asset(
                          "assets/images/icons/visibility_on.svg",
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(grey500, BlendMode.srcIn)
                          ,
                        ),
                      ),
                    ),
                  ],
                ),

                /// Apartment name
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      controller: _apartmentNameController,
                      hintText: "Apartment Name",
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 24)),

                UnitUploadImagesSection(),
              ],
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 24,
                ),
                child: CustomFilledButton(text: "Save Changes", onTap: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
