import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ga_final/app/app.dart';

class CustomInternationalPhoneFild extends StatelessWidget {
  const CustomInternationalPhoneFild({
    super.key,
    required this.text,
    this.validation,
    this.initialvalue,
    this.onInputChanged,
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

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: Styles.black50014),
          Dimens.boxHeight4,
          InternationalPhoneNumberInput(
            isEnabled: true,
            onInputChanged: onInputChanged,
            textStyle: Styles.black50014,
            onInputValidated: oninitialValidation,
            initialValue: initialvalue,
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
              setSelectorButtonAsPrefixIcon: true,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            selectorTextStyle: const TextStyle(color: ColorsValue.color2E363F),
            textFieldController: textEditingController,
            formatInput: false,
            keyboardType: const TextInputType.numberWithOptions(
                signed: false, decimal: true),
            inputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.six),
              borderSide:
                  const BorderSide(color: ColorsValue.textfildBorder, width: 2),
            ),
            inputDecoration: InputDecoration(
              contentPadding: Dimens.edgeInsets15,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.six),
                borderSide: const BorderSide(
                    color: ColorsValue.textfildBorder, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.six),
                borderSide: const BorderSide(
                    color: ColorsValue.textfildBorder, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.six),
                borderSide: const BorderSide(
                    color: ColorsValue.textfildBorder, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: Dimens.two,
                  style: BorderStyle.solid,
                  color: ColorsValue.textfildBorder,
                ),
                borderRadius: BorderRadius.circular(Dimens.six),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: Dimens.two,
                  style: BorderStyle.solid,
                  color: ColorsValue.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(Dimens.six),
              ),
              hintText: hintText,
              hintStyle: Styles.greyAAA40014,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.six),
                borderSide: const BorderSide(
                    color: ColorsValue.textfildBorder, width: 2),
              ),
              filled: true,
              fillColor: ColorsValue.lightF3F4F6,
              errorStyle: Styles.txtRedW50010,
            ),
            validator: validation,
          ),
        ],
      );
}
