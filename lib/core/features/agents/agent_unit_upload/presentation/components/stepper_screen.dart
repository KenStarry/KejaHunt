import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/presentation/components/stepper/stepper_model.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class StepperScreen extends StatefulWidget {
  final PageController pageController;
  final List<StepperModel> steppers;

  const StepperScreen({super.key, required this.pageController, required this.steppers});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 90,
            child: EasyStepper(
              activeStep: activeIndex,
              direction: Axis.horizontal,
              stepShape: StepShape.circle,
              enableStepTapping: false,
              unreachedStepBackgroundColor: Theme.of(
                context,
              ).scaffoldBackgroundColor,
              activeStepBackgroundColor: Theme.of(context).colorScheme.primary,
              stepRadius: 20,
              padding: EdgeInsets.zero,
              showTitle: true,
              showLoadingAnimation: false,
              showStepBorder: false,
              lineStyle: LineStyle(
                lineSpace: 6,
                lineType: LineType.normal,
                lineThickness: 8,
                lineLength: 80,
                unreachedLineColor: grey200,
                activeLineColor: Theme.of(context).colorScheme.primary,
                // progress: 0.5,
                // progressColor: Theme.of(context).colorScheme.primary,
              ),
              steps: widget.steppers.map((step) {
                final isActive = activeIndex >= widget.steppers.indexOf(step);

                return EasyStep(
                  customStep: SvgPicture.asset(
                    isActive ? step.activeIcon : step.inactiveIcon,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      isActive ? whiteColor : grey500,
                      BlendMode.srcIn,
                    ),
                  ),
                  customTitle: Text(
                    step.title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isActive
                          ? Theme.of(context).colorScheme.primary
                          : grey500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: widget.pageController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: widget.steppers[index].stepperScreen,
                ),
                itemCount: widget.steppers.length,
                onPageChanged: (index) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
