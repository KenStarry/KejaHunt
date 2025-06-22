import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_price_frequency_enum.dart';
import 'package:keja_hunt/core/domain/enum/units/unit_type_enum.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/domain/models/unit_feature_model.dart';
import 'package:keja_hunt/core/domain/models/unit_image_model.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/bloc/upload_unit_bloc.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/components/stepper_screen.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/components/unit_upload_images_section.dart';
import 'package:keja_hunt/core/presentation/components/custom_filled_button.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
import 'package:keja_hunt/core/presentation/components/stepper/stepper_model.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';
import 'package:uuid/uuid.dart';

class AgentUnitUploadPage extends StatefulWidget {
  const AgentUnitUploadPage({super.key});

  @override
  State<AgentUnitUploadPage> createState() => _AgentUnitUploadPageState();
}

class _AgentUnitUploadPageState extends State<AgentUnitUploadPage> {
  late final TextEditingController _apartmentNameController;
  List<UnitImageModel> pickedImages = [];

  @override
  void initState() {
    super.initState();

    _apartmentNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
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
          // IconButton(
          //   onPressed: () {},
          //   icon: UnconstrainedBox(
          //     child: SvgPicture.asset(
          //       "assets/images/icons/visibility_on.svg",
          //       width: 20,
          //       height: 20,
          //       colorFilter: ColorFilter.mode(
          //         grey500,
          //         BlendMode.srcIn,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            StepperScreen(
              steppers: [
                StepperModel(
                  activeIcon: "assets/images/icons/home_filled.svg",
                  inactiveIcon: "assets/images/icons/home_outlined.svg",
                  title: "Apartment",
                ),
                StepperModel(
                  activeIcon: "assets/images/icons/home_filled.svg",
                  inactiveIcon: "assets/images/icons/home_outlined.svg",
                  title: "Unit Details",
                ),
                StepperModel(
                  activeIcon: "assets/images/icons/home_filled.svg",
                  inactiveIcon: "assets/images/icons/home_outlined.svg",
                  title: "Features & Images",
                ),
                StepperModel(
                  activeIcon: "assets/images/icons/home_filled.svg",
                  inactiveIcon: "assets/images/icons/home_outlined.svg",
                  title: "Preview",
                ),
              ],
            ),

            // CustomScrollView(
            //   physics: const BouncingScrollPhysics(),
            //   slivers: [
            //     SliverAppBar(
            //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            //       surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            //       leading: IconButton(
            //         onPressed: () {},
            //         icon: SvgPicture.asset(
            //           "assets/images/icons/arrow_back.svg",
            //           width: 20,
            //           height: 20,
            //         ),
            //       ),
            //       title: Text(
            //         "Upload Unit",
            //         style: Theme.of(context).textTheme.titleMedium,
            //       ),
            //
            //       actions: [
            //         IconButton(
            //           onPressed: () {},
            //           icon: UnconstrainedBox(
            //             child: SvgPicture.asset(
            //               "assets/images/icons/visibility_on.svg",
            //               width: 20,
            //               height: 20,
            //               colorFilter: ColorFilter.mode(
            //                 grey500,
            //                 BlendMode.srcIn,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //
            //     /// Apartment name
            //     SliverPadding(
            //       padding: const EdgeInsets.symmetric(horizontal: 20),
            //       sliver: SliverToBoxAdapter(
            //         child: CustomTextField(
            //           controller: _apartmentNameController,
            //           hintText: "Apartment Name",
            //         ),
            //       ),
            //     ),
            //
            //     SliverToBoxAdapter(child: SizedBox(height: 24)),
            //
            //     UnitUploadImagesSection(
            //       onImagesPicked: (images) {
            //         setState(() {
            //           pickedImages = images
            //               .map((image) => UnitImageModel(imageFile: image))
            //               .toList();
            //         });
            //       },
            //     ),
            //   ],
            // ),
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
                              title: "Classic Studio",
                              description:
                                  "A very Spacious Studio that will leave you drooling",
                              price: 17500,
                              priceFrequency: UnitPriceFrequencyEnum.month.name,
                              features: [],
                              images: pickedImages,
                              unitType: UnitTypeEnum.studio.name,
                              floors: [4, 6],
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
