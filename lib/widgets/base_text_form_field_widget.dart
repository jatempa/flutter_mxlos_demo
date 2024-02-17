import 'package:flutter/material.dart';

class BaseTextFormFieldWidget extends StatelessWidget {
  final Function? onChanged;
  final Function? onSaved;
  final String? label, initialValue, errorMessage, hintText;
  final TextInputType? keyboardType;
  final bool isEnabled, obscureText;
  final TextCapitalization textCapitalizations;
  final int? maxLines, maxLength;
  final InputBorder? border;
  final Widget? suffixIcon;

  const BaseTextFormFieldWidget({
    Key? key,
    this.label,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.isEnabled = true,
    this.textCapitalizations = TextCapitalization.characters,
    this.onChanged,
    this.onSaved,
    this.errorMessage,
    this.maxLines,
    this.maxLength,
    this.obscureText = false,
    this.border,
    this.suffixIcon,
    this.hintText
  });

  @override
  Widget build(BuildContext context) {
    if (obscureText) {
      return TextFormField(
        maxLength: maxLength,
        initialValue: initialValue,
        keyboardType: keyboardType,
        enabled: isEnabled,
        textCapitalization: textCapitalizations,
        decoration: InputDecoration(
          hintText: hintText,
          border: border,
          labelText: label,
          suffixIcon: suffixIcon
        ),
        obscureText: obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        onChanged: (value) => onChanged!(value),
        onSaved: (value) => onSaved!(value)
      );
    }

    return TextFormField(
      maxLength: maxLength,
      initialValue: initialValue,
      keyboardType: keyboardType,
      enabled: isEnabled,
      textCapitalization: textCapitalizations,
      decoration: InputDecoration(
        hintText: hintText,
        border: border,
        labelText: label,
        suffixIcon: suffixIcon
      ),
      maxLines: maxLines,
      validator: (value) {
        if (value!.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      onChanged: (value) => onChanged!(value),
      onSaved: (value) => onSaved!(value)
    );
  }
}