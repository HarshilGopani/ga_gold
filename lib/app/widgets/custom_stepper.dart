import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';

import '../app.dart';


class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key, required this.customStepper});

  final List<CustomStepperView> customStepper;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    final trueCount =
        widget.customStepper.where((value) => value.isActivate == true).length;
    print(">>>> true Counter printed $trueCount");
    return Theme(
      data: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.grey,
              error: Colors.white,
              secondary: Colors.pink,
            ),
      ),
      child: AnotherStepper(
        stepperList: widget.customStepper.asMap().entries.map(
          (e) {
            var element = e.value;
            return StepperData(
              title: StepperText(
                element.title,
                textStyle: Styles.grey94A3B860012,
              ),
              subtitle: StepperText(
                element.subTitle ?? '',
                textStyle: Styles.appColor70012,
              ),
              iconWidget: Container(
                height: Dimens.fourtyEight,
                width: Dimens.fourtyEight,
                padding: Dimens.edgeInsets8,
                decoration: BoxDecoration(
                  color: element.isActivate
                      ? ColorsValue.appColor
                      : ColorsValue.greyD9D9D9,
                  borderRadius: BorderRadius.circular(
                    Dimens.hundred,
                  ),
                ),
                child:  Icon(
                  Icons.done,
                  color: ColorsValue.whiteColor,
                ),
              ),
            );
          },
        ).toList(),
        activeIndex: trueCount,
        stepperDirection: Axis.vertical,
        iconWidth: Dimens.fourty,
        iconHeight: Dimens.fourty,
        activeBarColor: ColorsValue.appColor,
        inActiveBarColor: ColorsValue.greyD9D9D9,
        verticalGap: Dimens.thirty,
        barThickness: Dimens.five,
      ),
    );
  }

  Color activeColor() {
    Color selectedColor = ColorsValue.whiteColor;
    for (var element in widget.customStepper) {
      element.isActivate
          ? selectedColor = ColorsValue.appColor
          : selectedColor = ColorsValue.whiteColor;
    }
    return selectedColor;
  }
}

class CustomStepperView {
  String title;
  String? subTitle;
  bool isActivate;

  CustomStepperView({
    required this.title,
    this.subTitle,
    required this.isActivate,
  });
}
