import 'package:flutter/material.dart';

import 'package:myapp/utils/ui_helpers.dart';
import 'package:myapp/widgets/base_text_form_field_widget.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _labelFirstName = "Nombre", _labelLastName = "Apellido";
  final _labelStreetName = "Calle", _labelNoInt = "No Interior";
  final _labelNoExt = "No Exterior", _labelZipCode = "CP";
  final _labelEmail = "Email";
  String? _firstName, _lastName, _streetName;
  String? _noInt, _noExt, _zipCode, _email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTextFormField(
          label: _labelFirstName,
          initialValue: _firstName,
          onChanged: (value) => {
            setState(() {
              _firstName = value;
            })
          }
        ),
        UIHelper.verticalSpaceSmall,
        buildTextFormField(
          label: _labelLastName,
          initialValue: _lastName,
          onChanged: (value) => {
            setState(() {
              _lastName = value;
            })
          }
        ),
        UIHelper.verticalSpaceSmall,
        buildTextFormField(
          label: _labelEmail,
          initialValue: _email,
          onChanged: (value) => {
            setState(() {
              _email = value;
            })
          }
        ),
        UIHelper.verticalSpaceSmall,
        buildTextFormField(
          label: _labelStreetName,
          initialValue: _streetName,
          onChanged: (value) => {
            setState(() {
              _streetName = value;
            })
          }
        ),        
        UIHelper.verticalSpaceSmall,
        Row(
          children: <Widget>[
            Expanded(
              child: buildTextFormField(
                label: _labelNoExt,
                initialValue: _noExt,
                maxLength: 6,
                onChanged: (value) {
                  if(value !=null && value.length <= 6) {
                    setState(() => _noExt = value);
                  }
                } 
              ),
            ),
            UIHelper.horizontalSpaceSmall,
            Expanded(
              child: buildTextFormField(
                label: _labelNoInt,
                initialValue: _noInt,
                maxLength: 6,
                onChanged: (value) {
                  if(value !=null && value.length <= 6) {
                    setState(() => _noInt = value);
                  }
                } 
              ),
            ),
            UIHelper.horizontalSpaceSmall,
            Expanded(
              child: buildTextFormField(
                label: _labelZipCode,
                initialValue: _zipCode,
                maxLength: 5,
                onChanged: (value) {
                  if(value !=null && value.length <= 5) {
                    setState(() => _zipCode = value);
                  }
                } 
              ),
            ),
          ]
        )       
      ],
    );
  }

  Widget buildTextFormField({
    String? initialValue,
    String? label,
    Function? onChanged,
    TextInputType? keyboardType,
    int? maxLength
  }) {
    return BaseTextFormFieldWidget(
      initialValue: initialValue,
      border: const OutlineInputBorder(),
      keyboardType: keyboardType,
      label: label,
      onChanged: onChanged,
      maxLength: maxLength,
    );
  }
}