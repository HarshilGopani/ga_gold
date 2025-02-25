import 'package:flutter/material.dart';
import 'package:ga_gold/app/app.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// ignore: must_be_immutable
class CustomInternationalPhoneFild extends StatelessWidget {
  CustomInternationalPhoneFild({
    super.key,
    required this.text,
    this.validation,
    this.initialvalue,
    this.onInputChanged,
    this.isShowText = false,
    this.isCompulsoryText = false,
    this.keyboardAction,
    this.textStyle,
    this.oninitialValidation,
    this.textEditingController,
    required this.hintText,
  });
  final String text;
  final String hintText;
  final String? Function(String?)? validation;
  final PhoneNumber? initialvalue;
  final Function(PhoneNumber)? onInputChanged;
  final Function(bool)? oninitialValidation;
  final TextEditingController? textEditingController;
  final bool isShowText;
  final bool isCompulsoryText;
  TextInputAction? keyboardAction;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isShowText
            ? isCompulsoryText
                ? Row(
                    children: [
                      Text(
                        text,
                        style: textStyle ?? Styles.txtFieldColorW90016,
                      ),
                      Dimens.boxWidth3,
                      Text(
                        "*",
                        textAlign: TextAlign.start,
                        style: Styles.redColor70016,
                      )
                    ],
                  )
                : Text(
                    text,
                    style: textStyle ?? Styles.txtFieldColorW90016,
                  )
            : Dimens.box0,
        Dimens.boxHeight4,
        InternationalPhoneNumberInput(
          textFieldController: textEditingController,
          validator: validation,
          onInputChanged: onInputChanged,
          onInputValidated: oninitialValidation,
          keyboardAction: keyboardAction,
          initialValue: initialvalue,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          ignoreBlank: false,
          formatInput: false,
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DROPDOWN,
            setSelectorButtonAsPrefixIcon: true,
            trailingSpace: false,
          ),
          selectorTextStyle: Styles.blackColormontserratW60014,
          textAlign: TextAlign.start,
          keyboardType: const TextInputType.numberWithOptions(
            signed: false,
            decimal: false,
          ),
          inputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Dimens.eight,
              ),
              borderSide: BorderSide.none),
          inputDecoration: InputDecoration(
            contentPadding: EdgeInsets.all(
              Dimens.thirteen,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Dimens.five,
              ),
              borderSide: BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  Dimens.five,
                ),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  Dimens.five,
                ),
                borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                Dimens.five,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                Dimens.five,
              ),
            ),
            hintText: hintText,
            hintStyle: Styles.txtFieldColormontserratW40014,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Dimens.five,
              ),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: ColorsValue.greyColor,
          ),
        ),
      ],
    );
  }
}
