import 'package:flutter/material.dart';

import 'package:myapp/models/user.dart';
import 'package:myapp/utils/ui_constants.dart';
import 'package:myapp/utils/ui_helpers.dart';
import 'package:myapp/widgets/base_text_form_field_widget.dart';

class CustomForm extends StatefulWidget {

  const CustomForm({super.key, required this.user});

  final User? user;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  String? _firstName, _lastName, _streetName;
  String? _noInt, _noExt, _zipCode, _email;

  @override
  void initState() {
    super.initState();

    if (widget.user != null) {
      _firstName = widget.user!.firstName;
      _lastName = widget.user!.lastName;
      _email = widget.user!.email;
      _streetName = widget.user!.streetName;
      _noInt = widget.user!.noInt;
      _noExt = widget.user!.noExt;
      _zipCode = widget.user!.zipCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTextFormField(
          label: labelFirstName,
          initialValue: _firstName,
          onChanged: (value) => {
            setState(() {
              _firstName = value;
            })
          }
        ),
        UIHelper.verticalSpaceSmall,
        buildTextFormField(
          label: labelLastName,
          initialValue: _lastName,
          onChanged: (value) => {
            setState(() {
              _lastName = value;
            })
          }
        ),
        UIHelper.verticalSpaceSmall,
        buildTextFormField(
          label: labelEmail,
          initialValue: _email,
          onChanged: (value) => {
            setState(() {
              _email = value;
            })
          }
        ),
        UIHelper.verticalSpaceSmall,
        buildTextFormField(
          label: labelStreetName,
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
                label: labelNoExt,
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
                label: labelNoInt,
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
                label: labelZipCode,
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