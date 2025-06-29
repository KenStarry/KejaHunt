import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/features/agents/agent_apartment_upload/presentation/components/apartment_details_section.dart';

import '../../../../../presentation/components/stepper/stepper_model.dart';
import '../../../agent_unit_upload/presentation/components/stepper_screen.dart';

class AgentApartmentUploadPage extends StatefulWidget {
  const AgentApartmentUploadPage({super.key});

  @override
  State<AgentApartmentUploadPage> createState() => _AgentApartmentUploadPageState();
}

class _AgentApartmentUploadPageState extends State<AgentApartmentUploadPage> {

  late final PageController _pageController;
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
          "New Apartment",
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
                  title: "Apartment Details",
                  stepperScreen: ApartmentDetailsSection(onNext: (){})
                ),
                StepperModel(
                  activeIcon: "assets/images/icons/show_filled.svg",
                  inactiveIcon: "assets/images/icons/show_outlined.svg",
                  title: "Preview",
                  stepperScreen: Text("Preview")
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
