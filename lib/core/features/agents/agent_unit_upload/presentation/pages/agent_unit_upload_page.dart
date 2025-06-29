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
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/components/unit_details_section.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/components/unit_preview_section.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/components/unit_upload_images_section.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/presentation/model/upload_unit_details_result_model.dart';
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
  late final PageController _pageController;
  UploadUnitDetailsResultModel? unitDetailsResultModel;
  List<UnitImageModel> pickedImages = [];
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0, keepPage: true);

    _pageController.addListener(() {
      setState(() {
        activeIndex = _pageController.page!.toInt();
      });
    });
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
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            StepperScreen(
              pageController: _pageController,
              steppers: [
                StepperModel(
                  activeIcon: "assets/images/icons/edit_alt_filled.svg",
                  inactiveIcon: "assets/images/icons/edit_alt_outlined.svg",
                  title: "Unit Details",
                  stepperScreen: UnitDetailsSection(
                    onNext: (unitDetailsResult) {
                        setState(() {
                          unitDetailsResultModel = unitDetailsResult;
                        });
                      _pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
                StepperModel(
                  activeIcon: "assets/images/icons/discount_filled.svg",
                  inactiveIcon: "assets/images/icons/discount_outlined.svg",
                  title: "Features & Images",
                  stepperScreen: UnitUploadImagesSection(
                    onImagesPicked: (images) {
                        setState(() {
                          pickedImages = images;
                        });

                      _pageController.animateToPage(
                        2,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
                StepperModel(
                  activeIcon: "assets/images/icons/show_filled.svg",
                  inactiveIcon: "assets/images/icons/show_outlined.svg",
                  title: "Preview",
                  stepperScreen: UnitPreviewSection(
                    uploadUnitDetailsResultModel: unitDetailsResultModel,
                    pickedUnitImages: pickedImages,
                    onSave: () {
                      final uuid = Uuid();

                      context.read<UploadUnitBloc>().add(
                        HouseUnitUploadEvent(
                          houseUnitModel: HouseUnitModel(
                            apartmentId: uuid.v4(),
                            title: unitTypeToReadableString(unitType: unitDetailsResultModel?.unitType ?? UnitTypeEnum.oneBr),
                            description:
                                unitDetailsResultModel?.unitDescription ??
                                'null',
                            price:
                                unitDetailsResultModel?.rentAmount.toDouble() ??
                                0.00,
                            priceFrequency:
                                unitDetailsResultModel?.priceFrequency ??
                                UnitPriceFrequencyEnum.month.name,
                            features:
                                unitDetailsResultModel?.selectedFeatures ?? [],
                            images: pickedImages,
                            unitType: unitDetailsResultModel?.unitType?.name ?? UnitTypeEnum.oneBr.name,
                            floors: [4, 6],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
