import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ga_final/app/app.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.text,
      this.inputFormatter,
      this.hintText,
      this.controller,
      this.obscure = false,
      this.autofocus = false,
      this.isCompulsoryText = false,
      this.readOnly = false,
      this.suffixIcon,
      this.prefixIcon,
      this.keyboardType,
      this.textInputAction,
      this.isShowText = true,
      this.maxLength,
      this.maxLines,
      this.hintTextStyle,
      this.validation,
      this.onChanged,
      this.fillColor,
      this.textAlign,
      this.textStyle,
      this.onTap});
  final String text;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscure;
  final bool autofocus;
  final bool isShowText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validation;
  final Color? fillColor;
  final bool isCompulsoryText;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputAction? textInputAction;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Function()? onTap;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isShowText
            ? widget.isCompulsoryText
                ? Row(
                    children: [
                      Text(widget.text,
                          style: widget.textStyle ?? Styles.color21212150014),
                      Dimens.boxWidth3,
                      Text(
                        "*",
                        textAlign: TextAlign.start,
                        style: Styles.txtRedBold10,
                      )
                    ],
                  )
                : Text(widget.text,
                    style: widget.textStyle ?? Styles.color21212150014)
            : Dimens.box0,
        Dimens.boxHeight5,
        TextFormField(
          controller: widget.controller,
          cursorColor: ColorsValue.appColor,
          obscureText: widget.obscure,
          readOnly: widget.readOnly,
          onChanged: widget.onChanged,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          autofocus: widget.autofocus,
          textAlign: widget.textAlign ?? TextAlign.left,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          validator: widget.validation,
          inputFormatters: widget.inputFormatter,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: widget.onTap,
          decoration: InputDecoration(
            suffixIconConstraints:
                const BoxConstraints(maxHeight: double.infinity),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            counterText: '',
            contentPadding: EdgeInsets.all(Dimens.thirteen),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: Dimens.two,
                style: BorderStyle.solid,
                color: ColorsValue.textfildBorder,
              ),
              borderRadius: BorderRadius.circular(Dimens.six),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: Dimens.two,
                style: BorderStyle.solid,
                color: ColorsValue.textfildBorder,
              ),
              borderRadius: BorderRadius.circular(Dimens.six),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: Dimens.two,
                style: BorderStyle.solid,
                color: ColorsValue.textfildBorder,
              ),
              borderRadius: BorderRadius.circular(Dimens.six),
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
                color: ColorsValue.textfildBorder,
              ),
              borderRadius: BorderRadius.circular(Dimens.six),
            ),
            fillColor: widget.fillColor ?? ColorsValue.lightF3F4F6,
            filled: true,
            hintStyle: widget.hintTextStyle ?? Styles.color9C9C9C40016,
            errorStyle: Styles.txtRedW50010,
            hintText: widget.hintText,
          ),
        )
      ],
    );
  }
}
