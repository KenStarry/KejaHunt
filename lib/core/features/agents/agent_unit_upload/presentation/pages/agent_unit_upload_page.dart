import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_price_frequency_enum.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_type_enum.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/bloc/upload_unit_bloc.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/components/unit_upload_images_section.dart';
import 'package:keja_hunt/core/presentation/components/custom_filled_button.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:uuid/uuid.dart';

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
                          colorFilter: ColorFilter.mode(
                            grey500,
                            BlendMode.srcIn,
                          ),
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
                child: BlocBuilder<UploadUnitBloc, UploadUnitState>(
                  builder: (context, uploadUnitState) {
                    return CustomFilledButton(
                      text: "Save Changes",
                      isLoading: uploadUnitState is UploadUnitLoading,
                      onTap: () {
                        final uuid = Uuid();

                        context.read<UploadUnitBloc>().add(
                          HouseUnitUploadEvent(
                            houseUnitModel: HouseUnitModel(
                              apartmentId: uuid.v4(),
                              title: "Beautiful 2 Bedroom Villa",
                              description: "",
                              price: 95000,
                              priceFrequency: UnitPriceFrequencyEnum.month.name,
                              features: [
                                UnitFeatureModel(featureId: uuid.v4(),
                                )
                              ],
                              images: [
                                UnitImageModel(
                                  imageUrl: "https://images.unsplash.com/photo-1621070659899-40b6b6f6731d?q=80&w=1113&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                  imageTag: "Front-View"
                                ),
                                UnitImageModel(
                                    imageUrl: "https://images.unsplash.com/photo-1653972233229-1b8c042d6d8e?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                    imageTag: "Sitting Room"
                                ),
                                UnitImageModel(
                                    imageUrl: "https://plus.unsplash.com/premium_photo-1674676471963-4c4643beb12d?q=80&w=739&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                    imageTag: "Balcony"
                                ),
                              ],
                              unitType: UnitTypeEnum.twoBr.name,
                              floors: [1, 3],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
