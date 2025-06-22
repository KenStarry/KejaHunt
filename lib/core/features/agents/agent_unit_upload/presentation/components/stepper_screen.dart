import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/presentation/components/stepper/stepper_model.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class StepperScreen extends StatefulWidget {

  final List<StepperModel> steppers;

  const StepperScreen({super.key, required this.steppers});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          EasyStepper(activeStep: 0,
              direction: Axis.horizontal,
              enableStepTapping: false,
              unreachedStepBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
              activeStepBackgroundColor: Theme.of(context).colorScheme.primary,
              stepRadius: 20,
              showTitle: true,
              showLoadingAnimation: false,
              showStepBorder: false,
              lineStyle: LineStyle(
                lineSpace: 6,
                lineType: LineType.normal,
                lineThickness: 8,
                lineLength: 80,
                unreachedLineColor: grey200,
                activeLineColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                progress: 0.5,
                progressColor: Theme.of(context).colorScheme.primary
              ),
              steps: [
            EasyStep(
                customStep: SvgPicture.asset("assets/images/icons/home_outlined.svg",
                width: 24,
                height: 24,),
              title: "Apartment Details"
            ),
            EasyStep(
                customStep: SvgPicture.asset("assets/images/icons/home_outlined.svg",
                  width: 24,
                  height: 24,),
                title: "Unit Details"
            ),
            EasyStep(
                customStep: SvgPicture.asset("assets/images/icons/home_outlined.svg",
                  width: 24,
                  height: 24,),
                title: "Image Details"
            ),
                EasyStep(
                    customStep: SvgPicture.asset("assets/images/icons/home_outlined.svg",
                      width: 24,
                      height: 24,),
                    title: "Preview"
                ),
          ]),
          Expanded(child: ColoredBox(
            color: redColor,
              child: Text("Content")))
        ],
      ),
    );
  }
}
