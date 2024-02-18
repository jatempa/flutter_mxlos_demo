import 'package:flutter/material.dart';

import 'package:myapp/widgets/base_text_form_field_widget.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String? initialValue;
  final String? label;
  final Function? onChanged;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool isEnabled;

  const CustomTextFormFieldWidget({
    super.key,
    this.initialValue,
    this.label,
    this.onChanged,
    this.keyboardType,
    this.maxLength,
    this.isEnabled = false,
  });

  @override
  Widget build(Object context) {
    return BaseTextFormFieldWidget(
      initialValue: initialValue,
      border: const OutlineInputBorder(),
      keyboardType: keyboardType,
      label: label,
      onChanged: onChanged,
      maxLength: maxLength,
      isEnabled: isEnabled,
    );
  }
}
