import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:myapp/models/user.dart';
import 'package:myapp/utils/ui_constants.dart';
import 'package:myapp/utils/ui_helpers.dart';
import 'package:myapp/widgets/base_text_form_field_widget.dart';

class CustomForm extends StatefulWidget {

  const CustomForm({super.key, required this.user, required this.isEnabled});

  final User? user;
  final bool isEnabled;

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
    if (widget.isEnabled) {
      return buildUserForm(key: const ValueKey(2), isEnabled: true);
    }

    return buildUserForm(key: const ValueKey(1), isEnabled: false);
  }

  Widget buildUserForm({Key? key, bool isEnabled = false}) {
    return Column(
      key: key,
      children: <Widget>[
        buildTextFormField(
          label: labelFirstName,
          initialValue: _firstName,
          onChanged: (value) => {
            setState(() {
              _firstName = value;
            })
          },
          isEnabled: isEnabled
        ),
        UIHelper.verticalSpaceSmall,
        buildTextFormField(
          label: labelLastName,
          initialValue: _lastName,
          onChanged: (value) => {
            setState(() {
              _lastName = value;
            })
          },
          isEnabled: isEnabled
        ),
        UIHelper.verticalSpaceSmall,
        buildTextFormField(
          label: labelEmail,
          initialValue: _email,
          onChanged: (value) => {
            setState(() {
              _email = value;
            })
          },
          isEnabled: isEnabled
        ),
        UIHelper.verticalSpaceSmall,
        buildTextFormField(
          label: labelStreetName,
          initialValue: _streetName,
          onChanged: (value) => {
            setState(() {
              _streetName = value;
            })
          },
          isEnabled: isEnabled
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
                },
                isEnabled: isEnabled
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
                },
                isEnabled: isEnabled
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
                },
                isEnabled: isEnabled
              ),
            ),
          ]
        ),
      ],
    );
  }

  Widget buildTextFormField({
    String? initialValue,
    String? label,
    Function? onChanged,
    TextInputType? keyboardType,
    int? maxLength,
    bool isEnabled = false,
  }) {
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